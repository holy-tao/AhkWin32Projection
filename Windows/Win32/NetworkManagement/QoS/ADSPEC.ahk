#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk
#Include .\IntServMainHdr.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk
#Include .\GenAdspecParams.ahk
#Include .\IS_ADSPEC_BODY.ahk

/**
 * The ADSPEC structure contains Adspec message information for RSVP.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-adspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class ADSPEC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Adspec header, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure.
     * @type {RsvpObjHdr}
     */
    adspec_header{
        get {
            if(!this.HasProp("__adspec_header"))
                this.__adspec_header := RsvpObjHdr(this.ptr + 0)
            return this.__adspec_header
        }
    }

    /**
     * Adspec message body.
     * @type {IS_ADSPEC_BODY}
     */
    adspec_body{
        get {
            if(!this.HasProp("__adspec_body"))
                this.__adspec_body := IS_ADSPEC_BODY(this.ptr + 8)
            return this.__adspec_body
        }
    }
}
