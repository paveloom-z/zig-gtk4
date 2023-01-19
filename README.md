### Notices

#### Mirrors

Repository:
- [Codeberg](https://codeberg.org/paveloom-z/zig-gtk4)
- [GitHub](https://github.com/paveloom-z/zig-gtk4)
- [GitLab](https://gitlab.com/paveloom-g/zig/zig-gtk4)

#### Prerequisites

Make sure you have installed:

- A development library for `gtk4`
- [Zig](https://ziglang.org) (`v0.10.1`)

#### Build

To build and install the library, run `zig build install`.

To run unit tests, run `zig build test`.

See `zig build --help` for more build options, including how to run examples.

#### Integrate

To integrate the bindings into your project:

1) Add this repository as a dependency in `zigmod.yml`:

    ```yml
    # <...>
    root_dependencies:
      - src: git https://github.com/paveloom-z/zig-gtk4
    ```

2) Make sure you have added the dependencies in your build script:

    ```zig
    // <...>
    const deps = @import("deps.zig");
    const gtk4_pkg = deps.pkgs.gtk4.pkg.?;
    // <...>
    pub fn build(b: *std.build.Builder) !void {
      // <...>
      // For each step
      inline for (steps) |step| {
          // Add the library package
          step.addPackage(gtk4_pkg);
          // Link the libraries
          step.linkLibC();
          step.linkSystemLibrary("gtk4");
          // Use the `stage1` compiler
          step.use_stage1 = true;
      }
      // <...>
    }
    ```
