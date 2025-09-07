#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include .\Rsvp_Hop_IPv4.ahk

/**
 * The RSVP_HOP structure contains information about an RSVP-enabled hop.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-rsvp_hop
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_HOP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * RSVP hop header, in the form of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure
     * @type {RsvpObjHdr}
     */
    hop_header{
        get {
            if(!this.HasProp("__hop_header"))
                this.__hop_header := RsvpObjHdr(this.ptr + 0)
            return this.__hop_header
        }
    }

    /**
     * @type {Rsvp_Hop_IPv4}
     */
    hop_ipv4{
        get {
            if(!this.HasProp("__hop_ipv4"))
                this.__hop_ipv4 := Rsvp_Hop_IPv4(this.ptr + 8)
            return this.__hop_ipv4
        }
    }
}
