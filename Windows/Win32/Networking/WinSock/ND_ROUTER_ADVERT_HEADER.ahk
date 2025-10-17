#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk
#Include .\ICMP_MESSAGE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ND_ROUTER_ADVERT_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {ICMP_MESSAGE}
     */
    nd_ra_hdr{
        get {
            if(!this.HasProp("__nd_ra_hdr"))
                this.__nd_ra_hdr := ICMP_MESSAGE(0, this)
            return this.__nd_ra_hdr
        }
    }

    /**
     * @type {Integer}
     */
    nd_ra_reachable {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    nd_ra_retransmit {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
