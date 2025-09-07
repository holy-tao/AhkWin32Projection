#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class RENDDATA extends Win32Struct
{
    static sizeof => 14

    static packingSize => 1

    /**
     * @type {Integer}
     */
    atyp {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulPosition {
        get => NumGet(this, 2, "uint")
        set => NumPut("uint", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    dxWidth {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    dyHeight {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 10, "uint")
        set => NumPut("uint", value, this, 10)
    }
}
