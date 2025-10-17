#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk
#Include .\ICMP_MESSAGE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ICMPV4_TIMESTAMP_MESSAGE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {ICMP_MESSAGE}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := ICMP_MESSAGE(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    OriginateTimestamp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ReceiveTimestamp {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    TransmitTimestamp {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
