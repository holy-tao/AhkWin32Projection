#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the shapes of line segment caps.
 * @remarks
 * In the illustration that follows, the  shaded area at the end of each line segment  shows  the  cap that  is added to the line segment  depending on the    value  of <b>XPS_LINE_CAP</b>.
 * 
 * <img alt="A diagram that shows examples of the different XPS_LINE_CAP styles" src="./images/XPS_LINE_CAP.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_cap
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_LINE_CAP extends Win32Enum {

    /**
     * Flat line cap.
     * Native name: XPS_LINE_CAP_FLAT
     * @type {Integer (Int32)}
     */
    static FLAT => 1

    /**
     * Round line cap.
     * Native name: XPS_LINE_CAP_ROUND
     * @type {Integer (Int32)}
     */
    static ROUND => 2

    /**
     * Square line cap.
     * Native name: XPS_LINE_CAP_SQUARE
     * @type {Integer (Int32)}
     */
    static SQUARE => 3

    /**
     * Triangular line cap.
     * Native name: XPS_LINE_CAP_TRIANGLE
     * @type {Integer (Int32)}
     */
    static TRIANGLE => 4
}
