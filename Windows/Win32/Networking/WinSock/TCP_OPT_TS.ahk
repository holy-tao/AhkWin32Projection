#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TCP_OPT_TS extends Win32Struct
{
    static sizeof => 10

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Kind {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Val {
        get => NumGet(this, 2, "uint")
        set => NumPut("uint", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    EcR {
        get => NumGet(this, 6, "uint")
        set => NumPut("uint", value, this, 6)
    }
}
