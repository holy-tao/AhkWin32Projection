#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPV4_OPTION_HEADER extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Integer}
     */
    OptionType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OptionLength {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
