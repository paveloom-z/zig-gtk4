const std = @import("std");

/// Create a namespace for the casting functions
pub fn Cast(comptime T: type) type {
    return struct {
        /// Cast the pointer to a Zig struct to a pointer to a C struct
        pub inline fn toGTK(ptr: anytype) ?*T.GTK {
            return @ptrCast(?*T.GTK, ptr);
        }
        /// Cast the `const` pointer to a Zig struct to a `const` pointer to a C struct
        pub inline fn toConstGTK(ptr: anytype) ?*const T.GTK {
            return @ptrCast(?*const T.GTK, ptr);
        }
        /// Cast the pointer to a C struct to a pointer to a Zig struct
        pub inline fn fromGTK(ptr: anytype) ?*T {
            return @ptrCast(?*T, ptr);
        }
        /// Cast the `const` pointer to a C struct to a `const` pointer to a Zig struct
        pub inline fn fromConstGTK(ptr: anytype) ?*const T {
            return @ptrCast(?*const T, ptr);
        }
    };
}
