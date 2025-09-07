#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk
#Include .\ICMP_MESSAGE.ahk
#Include .\IN6_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ND_REDIRECT_HEADER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {ICMP_MESSAGE}
     */
    nd_rd_hdr{
        get {
            if(!this.HasProp("__nd_rd_hdr"))
                this.__nd_rd_hdr := ICMP_MESSAGE(this.ptr + 0)
            return this.__nd_rd_hdr
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    nd_rd_target{
        get {
            if(!this.HasProp("__nd_rd_target"))
                this.__nd_rd_target := IN6_ADDR(this.ptr + 8)
            return this.__nd_rd_target
        }
    }

    /**
     * @type {IN6_ADDR}
     */
    nd_rd_dst{
        get {
            if(!this.HasProp("__nd_rd_dst"))
                this.__nd_rd_dst := IN6_ADDR(this.ptr + 24)
            return this.__nd_rd_dst
        }
    }
}
