#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the joint made by two intersecting line segments.
 * @remarks
 * In the illustration that follows, the shaded area at the vertex of the line segments in each  example shows how the joint fill is determined by the value of <b>XPS_LINE_JOIN</b>.
 * 
 * <img alt="A diagram that shows examples of the different XPS_LINE_JOIN values" src="./images/XPS_LINE_JOIN.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_join
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_LINE_JOIN extends Win32Enum{

    /**
     * Produces a sharp or clipped corner, depending on whether the length of the miter exceeds the miter limit.
     * @type {Integer (Int32)}
     */
    static XPS_LINE_JOIN_MITER => 1

    /**
     * Produces a diagonal corner.
     * @type {Integer (Int32)}
     */
    static XPS_LINE_JOIN_BEVEL => 2

    /**
     * Produces a smooth, circular arc between the lines.
     * @type {Integer (Int32)}
     */
    static XPS_LINE_JOIN_ROUND => 3
}
