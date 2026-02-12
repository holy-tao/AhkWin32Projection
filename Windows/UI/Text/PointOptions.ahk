#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines options for specifying or retrieving a point.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.pointoptions
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class PointOptions extends Win32BitflagEnum{

    /**
     * No options.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Add left and top insets to the left and top coordinates of the rectangle, and subtract right and bottom insets from the right and bottom coordinates.
     * @type {Integer (UInt32)}
     */
    static IncludeInset => 1

    /**
     * The start position of the text range.
     * @type {Integer (UInt32)}
     */
    static Start => 32

    /**
     * Return client coordinates instead of screen coordinates.
     * @type {Integer (UInt32)}
     */
    static ClientCoordinates => 256

    /**
     * Allow points outside of the client area.
     * @type {Integer (UInt32)}
     */
    static AllowOffClient => 512

    /**
     * Transform coordinates using a world transform supplied by the host app.
     * @type {Integer (UInt32)}
     */
    static Transform => 1024

    /**
     * Horizontal scrolling is disabled.
     * @type {Integer (UInt32)}
     */
    static NoHorizontalScroll => 65536

    /**
     * Vertical scrolling is disabled.
     * @type {Integer (UInt32)}
     */
    static NoVerticalScroll => 262144
}
