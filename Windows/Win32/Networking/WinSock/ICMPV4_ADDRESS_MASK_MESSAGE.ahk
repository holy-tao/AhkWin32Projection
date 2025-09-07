#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk
#Include .\ICMP_MESSAGE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ICMPV4_ADDRESS_MASK_MESSAGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {ICMP_MESSAGE}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := ICMP_MESSAGE(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    AddressMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
