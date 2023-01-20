const std = @import("std");

const gtk = @import("../gtk4.zig");

const Cast = gtk.Cast;
const c = gtk.c;

/// The base class for all widgets
pub const Widget = extern struct {
    const Self = @This();
    pub const GTK = c.GtkWidget;
    parent_instance: c.GInitiallyUnowned,
    priv: ?*c.GtkWidgetPrivate,
    usingnamespace Cast(Self);
    /// Obtain the current default reading direction
    pub extern fn gtk_widget_get_default_direction() c.GtkTextDirection;
    /// Set the default reading direction for widgets
    pub extern fn gtk_widget_set_default_direction(dir: c.GtkTextDirection) void;
    /// Get the type of the widget
    pub extern fn gtk_widget_get_type() c.GType;
};

/// Widget declarations
pub const WidgetDecls = extern struct {
    /// Enable or disable an action installed with `classInstallAction`
    pub extern fn gtk_widget_action_set_enabled(self: anytype, action_name: [*c]const u8, enabled: gboolean) void;
    /// For widgets that can be "activated" (buttons, menu items, etc.), this function activates them
    pub extern fn gtk_widget_activate(self: anytype) gboolean;
    /// Look up the action in the action groups associated with widget and its ancestors, and activate it
    pub extern fn gtk_widget_activate_action(self: anytype, name: [*c]const u8, format_string: [*c]const u8, ...) gboolean;
    /// Look up the action in the action groups associated with widget and its ancestors, and activate it
    pub extern fn gtk_widget_activate_action_variant(self: anytype, name: [*c]const u8, args: ?*GVariant) gboolean;
    /// Activate the default.activate action from widget
    pub extern fn gtk_widget_activate_default(self: anytype) void;
    /// Add controller to widget so that it will receive events
    pub extern fn gtk_widget_add_controller(self: anytype, controller: ?*GtkEventController) void;
    /// Add a style class to widget
    pub extern fn gtk_widget_add_css_class(self: anytype, css_class: [*c]const u8) void;
    /// Add a widget to the list of mnemonic labels for this widget
    pub extern fn gtk_widget_add_mnemonic_label(self: anytype, label: [*c]GtkWidget) void;
    /// Queue an animation frame update and adds a callback to be called before each frame
    pub extern fn gtk_widget_add_tick_callback(self: anytype, callback: GtkTickCallback, user_data: gpointer, notify: GDestroyNotify) guint;
    /// This function is only used by `GtkWidget` subclasses, to assign a size,
    /// position and (optionally) baseline to their child widgets.
    pub extern fn gtk_widget_allocate(self: anytype, width: c_int, height: c_int, baseline: c_int, transform: ?*GskTransform) void;
    /// Called by widgets as the user moves around the window using keyboard shortcuts
    pub extern fn gtk_widget_child_focus(self: anytype, direction: GtkDirectionType) gboolean;
    /// Compute the bounds for widget in the coordinate space of target
    pub extern fn gtk_widget_compute_bounds(self: anytype, target: [*c]GtkWidget, out_bounds: [*c]graphene_rect_t) gboolean;
    /// Compute whether a container should give this widget extra space when possible
    pub extern fn gtk_widget_compute_expand(self: anytype, orientation: GtkOrientation) gboolean;
    /// Translate the given point in widget‘s coordinates to coordinates relative to target’s coordinate system
    pub extern fn gtk_widget_compute_point(self: anytype, target: [*c]GtkWidget, point: [*c]const graphene_point_t, out_point: [*c]graphene_point_t) gboolean;
    /// Compute a matrix suitable to describe a transformation from widget‘s coordinate system into target‘s coordinate system
    pub extern fn gtk_widget_compute_transform(self: anytype, target: [*c]GtkWidget, out_transform: [*c]graphene_matrix_t) gboolean;
    /// Test if the point at (x, y) is contained in widget
    pub extern fn gtk_widget_contains(self: anytype, x: f64, y: f64) gboolean;
    /// Create a new `PangoContext` with the appropriate font map, font options,
    /// font description, and base direction for drawing text for this widget
    pub extern fn gtk_widget_create_pango_context(self: anytype) ?*PangoContext;
    /// Create a new `PangoLayout` with the appropriate font map,
    /// font description, and base direction for drawing text
    /// for this widget
    pub extern fn gtk_widget_create_pango_layout(self: anytype, text: [*c]const u8) ?*PangoLayout;
    /// Clear the template children for the given widget
    pub extern fn gtk_widget_dispose_template(self: anytype, widget_type: GType) void;
    /// Check to see if a drag movement has passed the GTK drag threshold
    pub extern fn gtk_drag_check_threshold(self: anytype, start_x: c_int, start_y: c_int, current_x: c_int, current_y: c_int) gboolean;
    /// Notify the user about an input-related error on this widget
    pub extern fn gtk_widget_error_bell(self: anytype) void;
    /// Return the baseline that has currently been allocated to widget
    pub extern fn gtk_widget_get_allocated_baseline(self: anytype) c_int;
    /// Return the height that has currently been allocated to widget
    pub extern fn gtk_widget_get_allocated_height(self: anytype) c_int;
    /// Return the width that has currently been allocated to widget
    pub extern fn gtk_widget_get_allocated_width(self: anytype) c_int;
    /// Retrieve the widget’s allocation
    pub extern fn gtk_widget_get_allocation(self: anytype, allocation: [*c]GtkAllocation) void;
    /// Get the first ancestor of `widget` with type `widget_type`
    pub extern fn gtk_widget_get_ancestor(self: anytype, widget_type: GType) [*c]GtkWidget;
    /// Determine whether the input focus can enter widget or any of its children
    pub extern fn gtk_widget_get_can_focus(self: anytype) gboolean;
    /// Query whether widget can be the target of pointer events
    pub extern fn gtk_widget_get_can_target(self: anytype) gboolean;
    /// Get the value set with `setChildVisible`
    pub extern fn gtk_widget_get_child_visible(self: anytype) gboolean;
    /// Get the clipboard object for `widget`
    pub extern fn gtk_widget_get_clipboard(self: anytype) ?*GdkClipboard;
    /// Return the list of style classes applied to widget
    pub extern fn gtk_widget_get_css_classes(self: anytype) [*c][*c]u8;
    /// Return the CSS name that is used for `self`
    pub extern fn gtk_widget_get_css_name(self: [*c]GtkWidget) [*c]const u8;
    /// Query the cursor set on `widget`
    pub extern fn gtk_widget_get_cursor(self: anytype) ?*GdkCursor;
    /// Get the reading direction for a particular widget
    pub extern fn gtk_widget_get_direction(self: anytype) GtkTextDirection;
    /// Get the reading direction for a particular widget
    pub extern fn gtk_widget_get_display(self: anytype) ?*GdkDisplay;
    /// Return the widgets first child
    pub extern fn gtk_widget_get_first_child(self: anytype) [*c]GtkWidget;
    /// Return the current focus child of `widget`
    pub extern fn gtk_widget_get_focus_child(self: anytype) [*c]GtkWidget;
    /// Return whether the widget should grab focus when it is clicked with the mouse
    pub extern fn gtk_widget_get_focus_on_click(self: anytype) gboolean;
    /// Determine whether `widget` can own the input focus
    pub extern fn gtk_widget_get_focusable(self: anytype) gboolean;
    /// Get the font map of `widget`
    pub extern fn gtk_widget_get_font_map(self: anytype) [*c]PangoFontMap;
    /// Return the `CairoFontOptions` of widget
    pub extern fn gtk_widget_get_font_options(self: anytype) ?*const cairo_font_options_t;
    /// Obtain the frame clock for a widget
    pub extern fn gtk_widget_get_frame_clock(self: anytype) ?*GdkFrameClock;
    /// Get the horizontal alignment of `widget`
    pub extern fn gtk_widget_get_halign(self: anytype) GtkAlign;
    /// Return the current value of the `has-tooltip` property
    pub extern fn gtk_widget_get_has_tooltip(self: anytype) gboolean;
    /// Return the content height of the `widget`
    pub extern fn gtk_widget_get_height(self: anytype) c_int;
    /// Get whether the widget would like any available extra horizontal space
    pub extern fn gtk_widget_get_hexpand(self: anytype) gboolean;
    /// Gets whether `setHExpand` has been used to explicitly set the expand flag on this widget
    pub extern fn gtk_widget_get_hexpand_set(self: anytype) gboolean;
    /// Returns the widget's last child
    pub extern fn gtk_widget_get_last_child(self: anytype) [*c]GtkWidget;
    /// Retrieve the layout manager used by widget
    pub extern fn gtk_widget_get_layout_manager(self: anytype) [*c]GtkLayoutManager;
    /// Whether the widget is mapped
    pub extern fn gtk_widget_get_mapped(self: anytype) gboolean;
    /// Get the bottom margin of `widget`
    pub extern fn gtk_widget_get_margin_bottom(self: anytype) c_int;
    /// Get the end margin of `widget`
    pub extern fn gtk_widget_get_margin_end(self: anytype) c_int;
    /// Get the start margin of `widget`
    pub extern fn gtk_widget_get_margin_start(self: anytype) c_int;
    /// Get the top margin of `widget`
    pub extern fn gtk_widget_get_margin_top(self: anytype) c_int;
    /// Retrieve the name of a widget
    pub extern fn gtk_widget_get_name(self: anytype) [*c]const u8;
    /// Return the nearest `Native` ancestor of widget
    pub extern fn gtk_widget_get_native(self: anytype) ?*GtkNative;
    /// Return the widgets next sibling
    pub extern fn gtk_widget_get_next_sibling(self: anytype) [*c]GtkWidget;
    /// Fetch the requested opacity for this widget
    pub extern fn gtk_widget_get_opacity(self: anytype) f64;
    /// Return the widget's overflow value
    pub extern fn gtk_widget_get_overflow(self: anytype) GtkOverflow;
    /// Get a `PangoContext` with the appropriate font map, font description, and base direction for this widget
    pub extern fn gtk_widget_get_pango_context(self: anytype) ?*PangoContext;
    /// Return the parent widget of `widget`
    pub extern fn gtk_widget_get_parent(self: anytype) [*c]GtkWidget;
    /// Retrieve the minimum and natural size of a widget,
    /// taking into account the widget’s preference for
    /// height-for-width management
    pub extern fn gtk_widget_get_preferred_size(self: anytype, minimum_size: [*c]GtkRequisition, natural_size: [*c]GtkRequisition) void;
    /// Return the widget's previous sibling
    pub extern fn gtk_widget_get_prev_sibling(self: anytype) [*c]GtkWidget;
    /// Get the primary clipboard of `widget`
    pub extern fn gtk_widget_get_primary_clipboard(self: anytype) ?*GdkClipboard;
    /// Determine whether widget is realized
    pub extern fn gtk_widget_get_realized(self: anytype) gboolean;
    /// Determine whether widget is always treated as the default widget
    /// within its toplevel when it has the focus, even if another widget
    /// is the default
    pub extern fn gtk_widget_get_receives_default(self: anytype) gboolean;
    /// Get whether the widget prefers a height-for-width layout or a
    /// width-for-height layout
    pub extern fn gtk_widget_get_request_mode(self: anytype) GtkSizeRequestMode;
    /// Return the `GtkRoot` widget of `widget`
    pub extern fn gtk_widget_get_root(self: anytype) ?*GtkRoot;
    /// Retrieve the internal scale factor that maps
    /// from window coordinates to the actual device
    /// pixels
    pub extern fn gtk_widget_get_scale_factor(self: anytype) c_int;
    /// Return the widget’s sensitivity
    pub extern fn gtk_widget_get_sensitive(self: anytype) gboolean;
    /// Get the settings object holding the settings used for this widget
    pub extern fn gtk_widget_get_settings(self: anytype) ?*GtkSettings;
    /// Return the content width or height of the widget
    pub extern fn gtk_widget_get_size(self: anytype, orientation: GtkOrientation) c_int;
    /// Get the size request that was explicitly
    /// set for the widget using `setSizeRequest`
    pub extern fn gtk_widget_get_size_request(self: anytype, width: [*c]c_int, height: [*c]c_int) void;
    /// Return the widget state as a flag set
    pub extern fn gtk_widget_get_state_flags(self: anytype) GtkStateFlags;
    /// Return the style context associated to `widget`
    pub extern fn gtk_widget_get_style_context(self: anytype) [*c]GtkStyleContext;
    /// Fetch an object build from the template XML
    /// for `widget_type` in this `widget` instance
    pub extern fn gtk_widget_get_template_child(self: anytype, widget_type: GType, name: [*c]const u8) [*c]GObject;
    /// Get the contents of the tooltip for `widget`
    pub extern fn gtk_widget_get_tooltip_markup(self: anytype) [*c]const u8;
    /// Get the contents of the tooltip for `widget`
    pub extern fn gtk_widget_get_tooltip_text(self: anytype) [*c]const u8;
    /// Get the vertical alignment of `widget`
    pub extern fn gtk_widget_get_valign(self: anytype) GtkAlign;
    /// Get whether the widget would like any available extra vertical space
    pub extern fn gtk_widget_get_vexpand(self: anytype) gboolean;
    /// Get whether `setVExpand` has been used to
    /// explicitly set the expand flag on this widget
    pub extern fn gtk_widget_get_vexpand_set(self: anytype) gboolean;
    /// Determine whether the widget is visible
    pub extern fn gtk_widget_get_visible(self: anytype) gboolean;
    /// Return the content width of the widget
    pub extern fn gtk_widget_get_width(self: anytype) c_int;
    /// Cause widget to have the keyboard focus for the `GtkWindow` it’s inside
    pub extern fn gtk_widget_grab_focus(self: anytype) gboolean;
    /// Returns whether `css_class` is currently applied to widget
    pub extern fn gtk_widget_has_css_class(self: anytype, css_class: [*c]const u8) gboolean;
    /// Determine whether `widget` is the current default widget within its toplevel
    pub extern fn gtk_widget_has_default(self: anytype) gboolean;
    /// Determine if the widget has the global input focus
    pub extern fn gtk_widget_has_focus(self: anytype) gboolean;
    /// Determine if the widget should show a visible
    /// indication that it has the global input focus
    pub extern fn gtk_widget_has_visible_focus(self: anytype) gboolean;
    /// Reverse the effects of `show`
    pub extern fn gtk_widget_hide(self: anytype) void;
    /// Return whether the widget is currently being destroyed
    pub extern fn gtk_widget_in_destruction(self: anytype) gboolean;
    /// Create and initialize child widgets defined in templates
    pub extern fn gtk_widget_init_template(self: anytype) void;
    /// Insert `group` into widget
    pub extern fn gtk_widget_insert_action_group(self: anytype, name: [*c]const u8, group: ?*GActionGroup) void;
    /// Insert `widget` into the child widget list of `parent`
    pub extern fn gtk_widget_insert_after(self: anytype, parent: [*c]GtkWidget, previous_sibling: [*c]GtkWidget) void;
    /// Insert `widget` into the child widget list of parent
    pub extern fn gtk_widget_insert_before(self: anytype, parent: [*c]GtkWidget, next_sibling: [*c]GtkWidget) void;
    /// Determines whether widget is somewhere inside
    /// ancestor, possibly with intermediate containers
    pub extern fn gtk_widget_is_ancestor(self: anytype, ancestor: [*c]GtkWidget) gboolean;
    /// Determine whether widget can be drawn to
    pub extern fn gtk_widget_is_drawable(self: anytype) gboolean;
    /// Determine if the widget is the focus widget within its toplevel
    pub extern fn gtk_widget_is_focus(self: anytype) gboolean;
    /// Return the widget’s effective sensitivity
    pub extern fn gtk_widget_is_sensitive(self: anytype) gboolean;
    /// Determine whether the widget and all its parents are marked as visible
    pub extern fn gtk_widget_is_visible(self: anytype) gboolean;
    /// Emits the `::keynav-failed` signal on the widget
    pub extern fn gtk_widget_keynav_failed(self: anytype, direction: GtkDirectionType) gboolean;
    /// Return the widgets for which this widget is the target of a mnemonic
    pub extern fn gtk_widget_list_mnemonic_labels(self: anytype) [*c]GList;
    /// Causes a widget to be mapped if it isn’t already
    pub extern fn gtk_widget_map(self: anytype) void;
    /// Measure widget in the orientation
    /// orientation and for the given for_size
    pub extern fn gtk_widget_measure(self: anytype, orientation: GtkOrientation, for_size: c_int, minimum: [*c]c_int, natural: [*c]c_int, minimum_baseline: [*c]c_int, natural_baseline: [*c]c_int) void;
    /// Emit the `::mnemonic-activate` signal
    pub extern fn gtk_widget_mnemonic_activate(self: anytype, group_cycling: gboolean) gboolean;
    /// Return a `GListModel` to track the children of widget
    pub extern fn gtk_widget_observe_children(self: anytype) ?*GListModel;
    /// Returns a `GListModel` to track the `GtkEventControllers` of widget
    pub extern fn gtk_widget_observe_controllers(self: anytype) ?*GListModel;
    /// Find the descendant of widget closest to the point (`x`, `y`)
    pub extern fn gtk_widget_pick(self: anytype, x: f64, y: f64, flags: GtkPickFlags) [*c]GtkWidget;
    /// Flag the widget for a rerun of the `WidgetClass.size_allocate` function
    pub extern fn gtk_widget_queue_allocate(self: anytype) void;
    /// Schedule this widget to be redrawn in the paint phase of the current or the next frame
    pub extern fn gtk_widget_queue_draw(self: anytype) void;
    /// Flag a widget to have its size renegotiated
    pub extern fn gtk_widget_queue_resize(self: anytype) void;
    /// Create the GDK resources associated with a widget
    pub extern fn gtk_widget_realize(self: anytype) void;
    /// Remove controller from widget, so that it doesn’t process events anymore
    pub extern fn gtk_widget_remove_controller(self: anytype, controller: ?*GtkEventController) void;
    /// Remove a style from widget
    pub extern fn gtk_widget_remove_css_class(self: anytype, css_class: [*c]const u8) void;
    /// Remove a widget from the list of mnemonic labels for this widget
    pub extern fn gtk_widget_remove_mnemonic_label(self: anytype, label: [*c]GtkWidget) void;
    /// Remove a tick callback previously registered with `addTickCallback`
    pub extern fn gtk_widget_remove_tick_callback(self: anytype, id: guint) void;
    /// Specify whether the input focus can enter the widget or any of its children
    pub extern fn gtk_widget_set_can_focus(self: anytype, can_focus: gboolean) void;
    /// Set whether `widget` can be the target of pointer events
    pub extern fn gtk_widget_set_can_target(self: anytype, can_target: gboolean) void;
    /// Set whether `widget` should be mapped along with its parent
    pub extern fn gtk_widget_set_child_visible(self: anytype, child_visible: gboolean) void;
    /// Clear all style classes applied to `widget` and replace them with `classes`
    pub extern fn gtk_widget_set_css_classes(self: anytype, classes: [*c][*c]const u8) void;
    /// Set the cursor to be shown when pointer devices point towards `widget`
    pub extern fn gtk_widget_set_cursor(self: anytype, cursor: ?*GdkCursor) void;
    /// Set a named cursor to be shown when pointer devices point towards `widget`
    pub extern fn gtk_widget_set_cursor_from_name(self: anytype, name: [*c]const u8) void;
    /// Set the reading direction on a particular `widget`
    pub extern fn gtk_widget_set_direction(self: anytype, dir: GtkTextDirection) void;
    /// Set child as the current focus child of `widget`
    pub extern fn gtk_widget_set_focus_child(self: anytype, child: [*c]GtkWidget) void;
    /// Set whether the widget should grab focus when it is clicked with the mouse
    pub extern fn gtk_widget_set_focus_on_click(self: anytype, focus_on_click: gboolean) void;
    /// Specifies whether `widget` can own the input focus
    pub extern fn gtk_widget_set_focusable(self: anytype, focusable: gboolean) void;
    /// Set the font map to use for Pango rendering
    pub extern fn gtk_widget_set_font_map(self: anytype, font_map: [*c]PangoFontMap) void;
    /// Set the `cairo_font_options_t` used for Pango rendering in this widget
    pub extern fn gtk_widget_set_font_options(self: anytype, options: ?*const cairo_font_options_t) void;
    /// Set the horizontal alignment of `widget`
    pub extern fn gtk_widget_set_halign(self: anytype, @"align": GtkAlign) void;
    /// Set the `has-tooltip` property on widget to `has_tooltip`
    pub extern fn gtk_widget_set_has_tooltip(self: anytype, has_tooltip: gboolean) void;
    /// Set whether the widget would like any available extra horizontal space
    pub extern fn gtk_widget_set_hexpand(self: anytype, expand: gboolean) void;
    /// Set whether the `hexpand` flag will be used
    pub extern fn gtk_widget_set_hexpand_set(self: anytype, set: gboolean) void;
    /// Set the layout manager delegate instance that provides an
    /// implementation for measuring and allocating the children of
    /// `widget`
    pub extern fn gtk_widget_set_layout_manager(self: anytype, layout_manager: [*c]GtkLayoutManager) void;
    /// Set the bottom margin of `widget`
    pub extern fn gtk_widget_set_margin_bottom(self: anytype, margin: c_int) void;
    /// Set the end margin of `widget`
    pub extern fn gtk_widget_set_margin_end(self: anytype, margin: c_int) void;
    /// Set the start margin of `widget`
    pub extern fn gtk_widget_set_margin_start(self: anytype, margin: c_int) void;
    /// Set the top margin of `widget`
    pub extern fn gtk_widget_set_margin_top(self: anytype, margin: c_int) void;
    /// Set a widgets name
    pub extern fn gtk_widget_set_name(self: anytype, name: [*c]const u8) void;
    /// Request the `widget` to be rendered partially transparent
    pub extern fn gtk_widget_set_opacity(self: anytype, opacity: f64) void;
    /// Set how widget treats content that is
    /// drawn outside the widget’s content area
    pub extern fn gtk_widget_set_overflow(self: anytype, overflow: GtkOverflow) void;
    /// Set `parent` as the parent widget of `widget`
    pub extern fn gtk_widget_set_parent(self: anytype, parent: [*c]GtkWidget) void;
    /// Specify whether `widget` will be treated as the default widget
    /// within its toplevel when it has the focus, even if another widget
    /// is the default
    pub extern fn gtk_widget_set_receives_default(self: anytype, receives_default: gboolean) void;
    /// Set the sensitivity of a widget
    pub extern fn gtk_widget_set_sensitive(self: anytype, sensitive: gboolean) void;
    /// Set the minimum size of a widget
    pub extern fn gtk_widget_set_size_request(self: anytype, width: c_int, height: c_int) void;
    /// Turn on flag values in the current widget state
    pub extern fn gtk_widget_set_state_flags(self: anytype, flags: GtkStateFlags, clear: gboolean) void;
    /// Set markup as the contents of the tooltip, which is marked up with Pango markup
    pub extern fn gtk_widget_set_tooltip_markup(self: anytype, markup: [*c]const u8) void;
    /// Set `text` as the contents of the tooltip
    pub extern fn gtk_widget_set_tooltip_text(self: anytype, text: [*c]const u8) void;
    /// Set the vertical alignment of `widget`
    pub extern fn gtk_widget_set_valign(self: anytype, @"align": GtkAlign) void;
    /// Set whether the widget would like any available extra vertical space
    pub extern fn gtk_widget_set_vexpand(self: anytype, expand: gboolean) void;
    /// Set whether the `vexpand` flag will be used
    pub extern fn gtk_widget_set_vexpand_set(self: anytype, set: gboolean) void;
    /// Set the visibility state of `widget`
    pub extern fn gtk_widget_set_visible(self: anytype, visible: gboolean) void;
    /// Returns whether `widget` should contribute to the measuring and allocation of its parent
    pub extern fn gtk_widget_should_layout(self: anytype) gboolean;
    /// Flag a widget to be displayed
    pub extern fn gtk_widget_show(self: anytype) void;
    /// Allocate widget with a transformation that translates
    /// the origin to the position in allocation
    pub extern fn gtk_widget_size_allocate(self: anytype, allocation: [*c]const GtkAllocation, baseline: c_int) void;
    /// Snapshot the child of `widget`
    pub extern fn gtk_widget_snapshot_child(self: anytype, child: [*c]GtkWidget, snapshot: ?*GtkSnapshot) void;
    /// Translate coordinates relative to `src_widget`’s allocation
    /// to coordinates relative to `dest_widget`’s allocations
    pub extern fn gtk_widget_translate_coordinates(src_self: anytype, dest_widget: [*c]GtkWidget, src_x: f64, src_y: f64, dest_x: [*c]f64, dest_y: [*c]f64) gboolean;
    /// Trigger a tooltip query on the display
    /// where the toplevel of `widget` is located
    pub extern fn gtk_widget_trigger_tooltip_query(self: anytype) void;
    /// Cause a widget to be unmapped if it’s currently mapped
    pub extern fn gtk_widget_unmap(self: anytype) void;
    /// Dissociate `widget` from its parent
    pub extern fn gtk_widget_unparent(self: anytype) void;
    /// Cause a widget to be unrealized (free all GDK resources associated with the widget)
    pub extern fn gtk_widget_unrealize(self: anytype) void;
    /// Turn off flag values for the current widget state
    pub extern fn gtk_widget_unset_state_flags(self: anytype, flags: GtkStateFlags) void;
};

pub const WidgetClass = extern struct {
    const Self = @This();
    pub const Gtk = c.GtkWidgetClass;
    parent_class: c.GInitiallyUnownedClass,
    show: ?fn (*Widget) callconv(.C) void,
    hide: ?fn (*Widget) callconv(.C) void,
    map: ?fn (*Widget) callconv(.C) void,
    unmap: ?fn (*Widget) callconv(.C) void,
    realize: ?fn (*Widget) callconv(.C) void,
    unrealize: ?fn (*Widget) callconv(.C) void,
    root: ?fn (*Widget) callconv(.C) void,
    unroot: ?fn (*Widget) callconv(.C) void,
    size_allocate: ?fn (*Widget, c_int, c_int, c_int) callconv(.C) void,
    state_flags_changed: ?fn (*Widget, c.GtkStateFlags) callconv(.C) void,
    direction_changed: ?fn (*Widget, c.GtkTextDirection) callconv(.C) void,
    get_request_mode: ?fn (*Widget) callconv(.C) c.GtkSizeRequestMode,
    measure: ?fn (*Widget, c.GtkOrientation, c_int, *c_int, *c_int, *c_int, *c_int) callconv(.C) void,
    mnemonic_activate: ?fn (*Widget, c.gboolean) callconv(.C) c.gboolean,
    grab_focus: ?fn (*Widget) callconv(.C) c.gboolean,
    focus: ?fn (*Widget, c.GtkDirectionType) callconv(.C) c.gboolean,
    set_focus_child: ?fn (*Widget, *Widget) callconv(.C) void,
    move_focus: ?fn (*Widget, c.GtkDirectionType) callconv(.C) void,
    keynav_failed: ?fn (*Widget, c.GtkDirectionType) callconv(.C) c.gboolean,
    query_tooltip: ?fn (*Widget, c_int, c_int, c.gboolean, ?*c.GtkTooltip) callconv(.C) c.gboolean,
    compute_expand: ?fn (*Widget, *c.gboolean, *c.gboolean) callconv(.C) void,
    css_changed: ?fn (*Widget, ?*c.GtkCssStyleChange) callconv(.C) void,
    system_setting_changed: ?fn (*Widget, c.GtkSystemSetting) callconv(.C) void,
    snapshot: ?fn (*Widget, ?*c.GtkSnapshot) callconv(.C) void,
    contains: ?fn (*Widget, f64, f64) callconv(.C) c.gboolean,
    priv: ?*c.GtkWidgetClassPrivate,
    padding: [8]c.gpointer,
    usingnamespace Cast(Self);
    pub extern fn gtk_widget_class_add_binding(self: *Self, keyval: guint, mods: GdkModifierType, callback: GtkShortcutFunc, format_string: [*c]const u8, ...) void;
    pub extern fn gtk_widget_class_add_binding_action(self: *Self, keyval: guint, mods: GdkModifierType, action_name: [*c]const u8, format_string: [*c]const u8, ...) void;
    pub extern fn gtk_widget_class_add_binding_signal(self: *Self, keyval: guint, mods: GdkModifierType, signal: [*c]const u8, format_string: [*c]const u8, ...) void;
    pub extern fn gtk_widget_class_add_shortcut(self: *Self, shortcut: ?*GtkShortcut) void;
    pub extern fn gtk_widget_class_bind_template_callback_full(self: *Self, callback_name: [*c]const u8, callback_symbol: GCallback) void;
    pub extern fn gtk_widget_class_bind_template_child_full(self: *Self, name: [*c]const u8, internal_child: gboolean, struct_offset: gssize) void;
    pub extern fn gtk_widget_class_get_accessible_role(self: *Self) GtkAccessibleRole;
    pub extern fn gtk_widget_class_get_activate_signal(self: *Self) guint;
    pub extern fn gtk_widget_class_get_css_name(self: *Self) [*c]const u8;
    pub extern fn gtk_widget_class_get_layout_manager_type(self: *Self) GType;
    pub extern fn gtk_widget_class_install_action(self: *Self, action_name: [*c]const u8, parameter_type: [*c]const u8, activate: GtkWidgetActionActivateFunc) void;
    pub extern fn gtk_widget_class_install_property_action(self: *Self, action_name: [*c]const u8, property_name: [*c]const u8) void;
    pub extern fn gtk_widget_class_query_action(self: *Self, index_: guint, owner: [*c]GType, action_name: [*c][*c]const u8, parameter_type: [*c]?*const GVariantType, property_name: [*c][*c]const u8) gboolean;
    pub extern fn gtk_widget_class_set_accessible_role(self: *Self, accessible_role: GtkAccessibleRole) void;
    pub extern fn gtk_widget_class_set_activate_signal(self: *Self, signal_id: guint) void;
    pub extern fn gtk_widget_class_set_activate_signal_from_name(self: *Self, signal_name: [*c]const u8) void;
    pub extern fn gtk_widget_class_set_css_name(self: *Self, name: [*c]const u8) void;
    pub extern fn gtk_widget_class_set_layout_manager_type(self: *Self, @"type": GType) void;
    pub extern fn gtk_widget_class_set_template(self: *Self, template_bytes: ?*GBytes) void;
    pub extern fn gtk_widget_class_set_template_from_resource(self: *Self, resource_name: [*c]const u8) void;
    pub extern fn gtk_widget_class_set_template_scope(self: *Self, scope: ?*GtkBuilderScope) void;
};
