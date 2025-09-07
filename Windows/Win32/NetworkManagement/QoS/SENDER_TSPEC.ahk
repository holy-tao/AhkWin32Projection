#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk
#Include .\IntServMainHdr.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk
#Include .\GenTspecParms.ahk
#Include .\GenTspec.ahk
#Include .\QualTspec.ahk
#Include .\IntServTspecBody.ahk

/**
 * The SENDER_TSPEC structure contains information for an RSVP sender Tspec.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-sender_tspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class SENDER_TSPEC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Object header, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure.
     * @type {RsvpObjHdr}
     */
    stspec_header{
        get {
            if(!this.HasProp("__stspec_header"))
                this.__stspec_header := RsvpObjHdr(this.ptr + 0)
            return this.__stspec_header
        }
    }

    /**
     * Sender Tspec body information, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservtspecbody">IntServTspecBody</a> structure.
     * @type {IntServTspecBody}
     */
    stspec_body{
        get {
            if(!this.HasProp("__stspec_body"))
                this.__stspec_body := IntServTspecBody(this.ptr + 8)
            return this.__stspec_body
        }
    }
}
