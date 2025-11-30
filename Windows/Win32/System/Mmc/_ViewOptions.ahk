#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ViewOptions enumeration is used by the Views.Add method and specifies the visibility of the view, scope tree, and toolbars, as well as the persistence state of the view.
 * @see https://docs.microsoft.com/windows/win32/api//mmcobj/ne-mmcobj-_viewoptions
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _ViewOptions extends Win32Enum{

    /**
     * The view is added with default settings.
     * @type {Integer (Int32)}
     */
    static ViewOption_Default => 0

    /**
     * The view is added with the scope tree pane hidden. The user will not be able to show the scope tree, as the <b>Console Tree</b> check box will be disabled in the <b>Customize View</b> dialog box.
     * @type {Integer (Int32)}
     */
    static ViewOption_ScopeTreeHidden => 1

    /**
     * The view is added with toolbars hidden.
     * @type {Integer (Int32)}
     */
    static ViewOption_NoToolBars => 2

    /**
     * The view is added as temporary (without persistence capability).
     * @type {Integer (Int32)}
     */
    static ViewOption_NotPersistable => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ViewOption_ActionPaneHidden => 8
}
