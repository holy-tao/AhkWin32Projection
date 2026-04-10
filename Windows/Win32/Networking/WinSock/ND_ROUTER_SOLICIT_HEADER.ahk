#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_MESSAGE.ahk
#Include .\ICMP_HEADER.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class ND_ROUTER_SOLICIT_HEADER extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {ICMP_MESSAGE}
     */
    nd_rs_hdr {
        get {
            if(!this.HasProp("__nd_rs_hdr"))
                this.__nd_rs_hdr := ICMP_MESSAGE(0, this)
            return this.__nd_rs_hdr
        }
    }
}
