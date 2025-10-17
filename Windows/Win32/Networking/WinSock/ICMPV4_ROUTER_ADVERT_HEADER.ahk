#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk
#Include .\ICMP_MESSAGE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ICMPV4_ROUTER_ADVERT_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {ICMP_MESSAGE}
     */
    RaHeader{
        get {
            if(!this.HasProp("__RaHeader"))
                this.__RaHeader := ICMP_MESSAGE(0, this)
            return this.__RaHeader
        }
    }
}
