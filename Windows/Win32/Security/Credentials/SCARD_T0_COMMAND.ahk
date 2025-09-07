#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class SCARD_T0_COMMAND extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bCla {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bIns {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    bP1 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    bP2 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    bP3 {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
