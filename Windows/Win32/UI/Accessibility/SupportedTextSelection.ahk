#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the supported text selection attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-supportedtextselection
 * @namespace Windows.Win32.UI.Accessibility
 */
class SupportedTextSelection extends Win32Enum {

    /**
     * Does not support text selections.
     * Native name: SupportedTextSelection_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Supports a single, continuous text selection.
     * Native name: SupportedTextSelection_Single
     * @type {Integer (Int32)}
     */
    static Single => 1

    /**
     * Supports multiple, disjoint text selections.
     * Native name: SupportedTextSelection_Multiple
     * @type {Integer (Int32)}
     */
    static Multiple => 2
}
