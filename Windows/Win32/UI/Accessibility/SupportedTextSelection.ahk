#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the supported text selection attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-supportedtextselection
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct SupportedTextSelection {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Does not support text selections.
     * @type {Integer (Int32)}
     */
    static SupportedTextSelection_None => 0

    /**
     * Supports a single, continuous text selection.
     * @type {Integer (Int32)}
     */
    static SupportedTextSelection_Single => 1

    /**
     * Supports multiple, disjoint text selections.
     * @type {Integer (Int32)}
     */
    static SupportedTextSelection_Multiple => 2
}
