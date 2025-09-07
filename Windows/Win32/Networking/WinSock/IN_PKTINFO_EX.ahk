#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR.ahk
#Include .\IN_PKTINFO.ahk
#Include .\SCOPE_ID.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IN_PKTINFO_EX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {IN_PKTINFO}
     */
    pkt_info{
        get {
            if(!this.HasProp("__pkt_info"))
                this.__pkt_info := IN_PKTINFO(this.ptr + 0)
            return this.__pkt_info
        }
    }

    /**
     * @type {SCOPE_ID}
     */
    scope_id{
        get {
            if(!this.HasProp("__scope_id"))
                this.__scope_id := SCOPE_ID(this.ptr + 8)
            return this.__scope_id
        }
    }
}
