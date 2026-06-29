#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values used to specify the direction of navigation within the Microsoft UI Automation tree.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-navigatedirection
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct NavigateDirection {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The navigation direction is to the parent.
     * @type {Integer (Int32)}
     */
    static NavigateDirection_Parent => 0

    /**
     * The navigation direction is to the next sibling.
     * @type {Integer (Int32)}
     */
    static NavigateDirection_NextSibling => 1

    /**
     * The navigation direction is to the previous sibling.
     * @type {Integer (Int32)}
     */
    static NavigateDirection_PreviousSibling => 2

    /**
     * The navigation direction is to the first child.
     * @type {Integer (Int32)}
     */
    static NavigateDirection_FirstChild => 3

    /**
     * The navigation direction is to the last child.
     * @type {Integer (Int32)}
     */
    static NavigateDirection_LastChild => 4
}
