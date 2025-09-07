#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include .\Error_Spec_IPv4.ahk

/**
 * The ERROR_SPEC structure contains RSVP error messages.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-error_spec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class ERROR_SPEC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Error header, in the form of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure.
     * @type {RsvpObjHdr}
     */
    errs_header{
        get {
            if(!this.HasProp("__errs_header"))
                this.__errs_header := RsvpObjHdr(this.ptr + 0)
            return this.__errs_header
        }
    }

    /**
     * @type {Error_Spec_IPv4}
     */
    errs_ipv4{
        get {
            if(!this.HasProp("__errs_ipv4"))
                this.__errs_ipv4 := Error_Spec_IPv4(this.ptr + 8)
            return this.__errs_ipv4
        }
    }
}
