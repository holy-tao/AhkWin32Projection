#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk
#Include .\ICMP_MESSAGE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ICMPV4_ROUTER_SOLICIT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {ICMP_MESSAGE}
     */
    RsHeader{
        get {
            if(!this.HasProp("__RsHeader"))
                this.__RsHeader := ICMP_MESSAGE(0, this)
            return this.__RsHeader
        }
    }
}
