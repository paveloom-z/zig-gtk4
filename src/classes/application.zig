const std = @import("std");

const gtk = @import("../gtk4.zig");

const Cast = gtk.Cast;
const c = gtk.c;

/// Types of user actions that may be blocked by `GtkApplication`
pub usingnamespace struct {
    pub const APPLICATION_INHIBIT_IDLE = c.GTK_APPLICATION_INHIBIT_IDLE;
    pub const APPLICATION_INHIBIT_LOGOUT = c.GTK_APPLICATION_INHIBIT_LOGOUT;
    pub const APPLICATION_INHIBIT_SUSPEND = c.GTK_APPLICATION_INHIBIT_SUSPEND;
    pub const APPLICATION_INHIBIT_SWITCH = c.GTK_APPLICATION_INHIBIT_SWITCH;
};

/// A high-level API for writing applications
pub const GtkApplication = extern struct {
    /// Type of user actions that may be blocked by `GtkApplication`
    pub const InhibitFlags = c.GtkApplicationInhibitFlags;
    const Self = @This();
    pub const GTK = c.GtkApplication;
    parent_instance: c.GApplication,
    usingnamespace Cast(Self);
    /// Create a new `GtkApplication` instance
    pub fn new(
        application_id: ?[*:0]const u8,
        flags: c.GApplicationFlags,
    ) ?*GtkApplication {
        return c.gtk_application_new(
            application_id,
            flags,
        );
    }
    /// Adds a window to application
    pub fn addWindow(self: *Self, window: *c.GtkWindow) void {
        return c.gtk_application_add_window(self.toGTK(), window);
    }
    /// Get the accelerators that are currently associated with the given action
    pub fn getAccelsForAction(
        self: *Self,
        detailed_action_name: [*:0]const u8,
    ) ?[*][*:0]u8 {
        return c.gtk_application_get_accels_for_action(
            self.toGTK(),
            detailed_action_name,
        );
    }
    /// Return the list of actions (possibly empty) that `accel` maps to
    pub fn getActionsForAccel(
        self: *Self,
        accel: [*:0]const u8,
    ) ?[*][*:0]u8 {
        return c.gtk_application_get_actions_for_accel(
            self.toGTK(),
            accel,
        );
    }
    /// Get the "active" window for the application
    pub fn getActiveWindow(self: *Self) ?*c.GtkWindow {
        return c.gtk_application_get_active_window(self.toGTK());
    }
    /// Get a menu from automatically loaded resources
    pub fn getMenuById(self: *Self, id: [*:0]const u8) ?*c.GMenu {
        return c.gtk_application_get_menu_by_id(self.toGTK(), id);
    }
    /// Return the menu model that has been set with `set_menubar`
    pub fn getMenubar(self: *Self) ?*c.GMenuModel {
        return c.gtk_application_get_menubar(self.toGTK());
    }
    /// Return the `GtkApplicationWindow` with the given ID
    pub fn getWindowById(self: *Self, id: c.guint) ?*c.GtkWindow {
        return c.gtk_application_get_window_by_id(self.toGTK(), id);
    }
    /// Get a list of the `GtkWindow` instances associated with application
    pub fn getWindows(self: *Self) ?*c.GList {
        return c.gtk_application_get_windows(self.toGTK());
    }
    /// Inform the session manager that certain types of actions should be inhibited
    pub fn inhibit(
        application: *GtkApplication,
        window: ?*c.GtkWindow,
        flags: InhibitFlags,
        reason: [*:0]const u8,
    ) c.guint {
        return c.gtk_application_inhibit(
            application.toGTK(),
            window,
            flags,
            reason,
        );
    }
    /// List the detailed action names which have associated accelerators
    pub fn listActionDescriptions(self: *Self) ?[*][*:0]u8 {
        return c.gtk_application_list_action_descriptions(self.toGTK());
    }
    /// Remove a window from application
    pub fn removeWindow(self: *Self, window: *c.GtkWindow) void {
        c.gtk_application_remove_window(self.toGTK(), window);
    }
    /// Set zero or more keyboard accelerators that will trigger the given action
    pub fn setAccelsForAction(
        self: *Self,
        detailed_action_name: [*:0]const u8,
        accels: [*]const [*:0]const u8,
    ) void {
        c.gtk_application_set_accels_for_action(
            self.toGTK(),
            detailed_action_name,
            accels,
        );
    }
    /// Set or unset the menubar for windows of application
    pub fn setMenubar(
        self: *Self,
        menubar: ?*c.GMenuModel,
    ) void {
        c.gtk_application_set_menubar(
            self.toGTK(),
            menubar,
        );
    }
    /// Removes an inhibitor that has been previously established
    pub fn uninhibit(self: *Self, cookie: c.guint) void {
        c.gtk_application_uninhibit(self.toGTK(), cookie);
    }
};
