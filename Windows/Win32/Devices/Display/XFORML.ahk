#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FLOATOBJ_XFORM structure describes an arbitrary linear two-dimensional transform, such as for geometric wide lines.F
 * @remarks
 * All elements are specified as <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-floatobj">FLOATOBJ</a> values. The transform can be downloaded to the driver. Structure members can be operated on by the <b>FLOATOBJ_</b><i>Xxx</i> routines.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-xforml
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class XFORML extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    eM11 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    eM12 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    eM21 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Are the four <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-floatobj">FLOATOBJ</a> elements that comprise a 2x2 row-major matrix. The <b>eM11</b> member specifies the matrix element at row 1, column 1, the <b>eM12</b> member specifies the matrix element at row 1, column2, and so on.
     * @type {Integer}
     */
    eM22 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    eDx {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Are the x- and y-translation components of the transform.
     * @type {Integer}
     */
    eDy {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
