#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FD_XFORM structure describes an arbitrary two-dimensional font transform.
 * @remarks
 * This structure is used typically to hold notional-to-device-space font transformations.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fd_xform
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FD_XFORM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    eXX {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    eXY {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    eYX {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Are the four elements that comprise a 2x2 row-major matrix. <b>eXX</b> and <b>eXY</b> are the elements in the first row; <b>eYX</b> and <b>eYY</b> are the elements in the second row.
     * @type {Integer}
     */
    eYY {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
