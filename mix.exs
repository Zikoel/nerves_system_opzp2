defmodule OrangePiZeroPlus2.MixProject do
  use Mix.Project

  @app :nerves_system_opzp2
  @version Path.join(__DIR__, "VERSION")
           |> File.read!()
           |> String.trim()

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.6",
      nerves_package: nerves_package(),
      compilers: Mix.compilers() ++ [:nerves_package],
      description: description(),
      package: package(),
      deps: deps(),
      aliases: [loadconfig: [&bootstrap/1]]
    ]
  end

  def application do
    []
  end

  defp bootstrap(args) do
    set_target()
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  defp nerves_package do
    [
      type: :system,
      # artifact_sites: [
      #   {:github_releases, "nerves-project/#{@app}"}
      # ],
      #build_runner_opts: build_runner_opts(),
      platform: Nerves.System.BR,
      platform_config: [
        defconfig: "nerves_defconfig"
      ],
      checksum: package_files()
    ]
  end

  defp deps do
    [
      {:nerves, "~> 1.4.2", runtime: false},
      {:nerves_system_br, "1.6.8", runtime: false},
      # {:nerves_toolchain_arm_unknown_linux_gnueabihf, "1.1.0", runtime: false},
      {:nerves_toolchain_aarch64_unknown_linux_gnu, "1.2.0-rc.0", runtime: false},
      {:nerves_system_linter, "~> 0.3.0", runtime: false},
      {:ex_doc, "~> 0.18", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    """
    Nerves System - Orange Pi Zero Plus 2
    """
  end

  defp package do
    [
      maintainers: ["Elia Mazzuoli", "Alessandro Fontani"],
      files: package_files(),
      licenses: ["Apache 2.0"]
      # links: %{"GitHub" => "https://github.com/nerves-project/#{@app}"}
    ]
  end

  defp package_files do
    [
      "fwup_include",
      "rootfs_overlay",
      "CHANGELOG.md",
      "fwup-revert.conf",
      "fwup.conf",
      "LICENSE",
      "mix.exs",
      "nerves_defconfig",
      "post-build.sh",
      "post-createfs.sh",
      "README.md",
      "VERSION"
    ]
  end

  # defp build_runner_opts() do
  #   []
  # end

  defp set_target() do
    if function_exported?(Mix, :target, 1) do
      apply(Mix, :target, [:target])
    else
      System.put_env("MIX_TARGET", "target")
    end
  end
end
