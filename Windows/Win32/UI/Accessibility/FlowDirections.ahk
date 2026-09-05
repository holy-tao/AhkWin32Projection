#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values for the TextFlowDirections text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-flowdirections
 * @namespace Windows.Win32.UI.Accessibility
 */
class FlowDirections extends Win32Enum {

    /**
     * The default flow direction.
     * Native name: FlowDirections_Default
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The text flows from right to left.
     * Native name: FlowDirections_RightToLeft
     * @type {Integer (Int32)}
     */
    static RightToLeft => 1

    /**
     * The text flows from bottom to top.
     * Native name: FlowDirections_BottomToTop
     * @type {Integer (Int32)}
     */
    static BottomToTop => 2

    /**
     * The text flows vertically.
     * Native name: FlowDirections_Vertical
     * @type {Integer (Int32)}
     */
    static Vertical => 4
}
