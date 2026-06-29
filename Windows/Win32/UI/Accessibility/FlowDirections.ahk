#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values for the TextFlowDirections text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-flowdirections
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct FlowDirections {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The default flow direction.
     * @type {Integer (Int32)}
     */
    static FlowDirections_Default => 0

    /**
     * The text flows from right to left.
     * @type {Integer (Int32)}
     */
    static FlowDirections_RightToLeft => 1

    /**
     * The text flows from bottom to top.
     * @type {Integer (Int32)}
     */
    static FlowDirections_BottomToTop => 2

    /**
     * The text flows vertically.
     * @type {Integer (Int32)}
     */
    static FlowDirections_Vertical => 4
}
