#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the endpoints of a text range.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-textpatternrangeendpoint
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class TextPatternRangeEndpoint extends Win32Enum{

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
