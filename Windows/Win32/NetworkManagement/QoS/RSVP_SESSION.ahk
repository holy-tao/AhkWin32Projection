#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include .\Session_IPv4.ahk

/**
 * The RSVP_SESSION structure stores information about an RSVP SESSION message.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-rsvp_session
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_SESSION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * RSVP Object Header, in the form of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure.
     * @type {RsvpObjHdr}
     */
    sess_header{
        get {
            if(!this.HasProp("__sess_header"))
                this.__sess_header := RsvpObjHdr(this.ptr + 0)
            return this.__sess_header
        }
    }

    /**
     * @type {Session_IPv4}
     */
    sess_ipv4{
        get {
            if(!this.HasProp("__sess_ipv4"))
                this.__sess_ipv4 := Session_IPv4(this.ptr + 8)
            return this.__sess_ipv4
        }
    }
}
