#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the location of a docking window represented by the Dock control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-dockposition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct DockPosition {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The window is docked at the top.
     * @type {Integer (Int32)}
     */
    static DockPosition_Top => 0

    /**
     * The window is docked at the left.
     * @type {Integer (Int32)}
     */
    static DockPosition_Left => 1

    /**
     * The window is docked at the bottom.
     * @type {Integer (Int32)}
     */
    static DockPosition_Bottom => 2

    /**
     * The window is docked at the right.
     * @type {Integer (Int32)}
     */
    static DockPosition_Right => 3

    /**
     * The window is docked on all four sides.
     * @type {Integer (Int32)}
     */
    static DockPosition_Fill => 4

    /**
     * The window is not docked.
     * @type {Integer (Int32)}
     */
    static DockPosition_None => 5
}
