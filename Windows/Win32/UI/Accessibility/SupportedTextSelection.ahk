#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the supported text selection attribute.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-supportedtextselection
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class SupportedTextSelection{

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
