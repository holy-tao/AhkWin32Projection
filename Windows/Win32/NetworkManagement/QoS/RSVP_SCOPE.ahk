#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include .\Scope_list_ipv4.ahk

/**
 * The RSVP_SCOPE structure provides RSVP scope information.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-rsvp_scope
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_SCOPE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Scope header, in the form of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure.
     * @type {RsvpObjHdr}
     */
    scopl_header{
        get {
            if(!this.HasProp("__scopl_header"))
                this.__scopl_header := RsvpObjHdr(this.ptr + 0)
            return this.__scopl_header
        }
    }

    /**
     * @type {Scope_list_ipv4}
     */
    scopl_ipv4{
        get {
            if(!this.HasProp("__scopl_ipv4"))
                this.__scopl_ipv4 := Scope_list_ipv4(this.ptr + 8)
            return this.__scopl_ipv4
        }
    }
}
