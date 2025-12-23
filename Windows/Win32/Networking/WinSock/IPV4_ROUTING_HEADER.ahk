#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPV4_OPTION_HEADER.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPV4_ROUTING_HEADER extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * @type {IPV4_OPTION_HEADER}
     */
    OptionHeader{
        get {
            if(!this.HasProp("__OptionHeader"))
                this.__OptionHeader := IPV4_OPTION_HEADER(0, this)
            return this.__OptionHeader
        }
    }

    /**
     * @type {Integer}
     */
    Pointer {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
