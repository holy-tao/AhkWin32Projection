#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk
#Include .\ICMP_MESSAGE.ahk
#Include .\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ND_NEIGHBOR_ADVERT_HEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {ICMP_MESSAGE}
     */
    nd_na_hdr{
        get {
            if(!this.HasProp("__nd_na_hdr"))
                this.__nd_na_hdr := ICMP_MESSAGE(0, this)
            return this.__nd_na_hdr
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    nd_na_target{
        get {
            if(!this.HasProp("__nd_na_target"))
                this.__nd_na_target := IN6_ADDR(8, this)
            return this.__nd_na_target
        }
    }
}
