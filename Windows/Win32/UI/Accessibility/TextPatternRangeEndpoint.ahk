#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the endpoints of a text range.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-textpatternrangeendpoint
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct TextPatternRangeEndpoint {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The starting endpoint of the range.
     * @type {Integer (Int32)}
     */
    static TextPatternRangeEndpoint_Start => 0

    /**
     * The ending endpoint of the range.
     * @type {Integer (Int32)}
     */
    static TextPatternRangeEndpoint_End => 1
}
