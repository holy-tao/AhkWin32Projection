#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include .\Filter_Spec_IPv4.ahk
#Include .\Filter_Spec_IPv4GPI.ahk

/**
 * The FILTER_SPEC structure stores information about an RSVP FILTERSPEC.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-filter_spec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class FILTER_SPEC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * RSVP Object Header for the FILTERSPEC, in the form of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure.
     * @type {RsvpObjHdr}
     */
    filt_header{
        get {
            if(!this.HasProp("__filt_header"))
                this.__filt_header := RsvpObjHdr(this.ptr + 0)
            return this.__filt_header
        }
    }

    /**
     * @type {Filter_Spec_IPv4}
     */
    filt_ipv4{
        get {
            if(!this.HasProp("__filt_ipv4"))
                this.__filt_ipv4 := Filter_Spec_IPv4(this.ptr + 8)
            return this.__filt_ipv4
        }
    }

    /**
     * @type {Filter_Spec_IPv4GPI}
     */
    filt_ipv4gpi{
        get {
            if(!this.HasProp("__filt_ipv4gpi"))
                this.__filt_ipv4gpi := Filter_Spec_IPv4GPI(this.ptr + 8)
            return this.__filt_ipv4gpi
        }
    }
}
