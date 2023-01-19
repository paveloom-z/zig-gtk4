const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Add standard release options
    const mode = b.standardReleaseOptions();
    // Add the library
    const gtk4 = b.addStaticLibrary("gtk4", "src/gtk4.zig");
    gtk4.setBuildMode(mode);
    gtk4.install();
    // Add the unit tests
    const unit_tests_step = b.step("test", "Run the unit tests");
    const unit_tests = b.addTest("src/gtk4.zig");
    unit_tests.setBuildMode(mode);
    unit_tests_step.dependOn(&unit_tests.step);
    unit_tests.test_evented_io = true;
    // Add the dependencies
    inline for (.{
        gtk4,
        unit_tests,
    }) |step| {
        // Link the libraries
        step.linkLibC();
        step.linkSystemLibrary("gtk4");
        // Use the `stage1` compiler
        step.use_stage1 = true;
    }
}
