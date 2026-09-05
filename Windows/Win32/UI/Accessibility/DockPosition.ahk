#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the location of a docking window represented by the Dock control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-dockposition
 * @namespace Windows.Win32.UI.Accessibility
 */
class DockPosition extends Win32Enum {

    /**
     * The window is docked at the top.
     * Native name: DockPosition_Top
     * @type {Integer (Int32)}
     */
    static Top => 0

    /**
     * The window is docked at the left.
     * Native name: DockPosition_Left
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * The window is docked at the bottom.
     * Native name: DockPosition_Bottom
     * @type {Integer (Int32)}
     */
    static Bottom => 2

    /**
     * The window is docked at the right.
     * Native name: DockPosition_Right
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * The window is docked on all four sides.
     * Native name: DockPosition_Fill
     * @type {Integer (Int32)}
     */
    static Fill => 4

    /**
     * The window is not docked.
     * Native name: DockPosition_None
     * @type {Integer (Int32)}
     */
    static None => 5
}
