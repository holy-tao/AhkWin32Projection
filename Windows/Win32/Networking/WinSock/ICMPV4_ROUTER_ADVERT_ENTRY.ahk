#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ICMPV4_ROUTER_ADVERT_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {IN_ADDR}
     */
    RouterAdvertAddr{
        get {
            if(!this.HasProp("__RouterAdvertAddr"))
                this.__RouterAdvertAddr := IN_ADDR(this.ptr + 0)
            return this.__RouterAdvertAddr
        }
    }

    /**
     * @type {Integer}
     */
    PreferenceLevel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
