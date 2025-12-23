#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values for the TextFlowDirections text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-flowdirections
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class FlowDirections extends Win32Enum{

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
