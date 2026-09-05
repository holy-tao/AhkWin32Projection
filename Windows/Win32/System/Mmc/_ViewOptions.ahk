#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ViewOptions enumeration is used by the Views.Add method and specifies the visibility of the view, scope tree, and toolbars, as well as the persistence state of the view.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/ne-mmcobj-_viewoptions
 * @namespace Windows.Win32.System.Mmc
 */
class _ViewOptions extends Win32Enum {

    /**
     * The view is added with default settings.
     * Native name: ViewOption_Default
     * @type {Integer (Int32)}
     */
    static Option_Default => 0

    /**
     * The view is added with the scope tree pane hidden. The user will not be able to show the scope tree, as the <b>Console Tree</b> check box will be disabled in the <b>Customize View</b> dialog box.
     * Native name: ViewOption_ScopeTreeHidden
     * @type {Integer (Int32)}
     */
    static Option_ScopeTreeHidden => 1

    /**
     * The view is added with toolbars hidden.
     * Native name: ViewOption_NoToolBars
     * @type {Integer (Int32)}
     */
    static Option_NoToolBars => 2

    /**
     * The view is added as temporary (without persistence capability).
     * Native name: ViewOption_NotPersistable
     * @type {Integer (Int32)}
     */
    static Option_NotPersistable => 4

    /**
     * Native name: ViewOption_ActionPaneHidden
     * @type {Integer (Int32)}
     */
    static Option_ActionPaneHidden => 8
}
