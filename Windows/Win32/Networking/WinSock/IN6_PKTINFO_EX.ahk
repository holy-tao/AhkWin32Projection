#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN6_ADDR.ahk
#Include .\IN6_PKTINFO.ahk
#Include .\SCOPE_ID.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IN6_PKTINFO_EX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {IN6_PKTINFO}
     */
    pkt_info{
        get {
            if(!this.HasProp("__pkt_info"))
                this.__pkt_info := IN6_PKTINFO(0, this)
            return this.__pkt_info
        }
    }

    /**
     * @type {SCOPE_ID}
     */
    scope_id{
        get {
            if(!this.HasProp("__scope_id"))
                this.__scope_id := SCOPE_ID(20, this)
            return this.__scope_id
        }
    }
}
