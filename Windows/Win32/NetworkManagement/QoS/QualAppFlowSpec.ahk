#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk

/**
 * The QualAppFlowSpec structure contains FLOWSPEC information for a qualitative application.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-qualappflowspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QualAppFlowSpec extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * General information and length information for the QualAppFlowSpec object (this structure), expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservservicehdr">IntServServiceHdr</a> structure.
     * @type {IntServServiceHdr}
     */
    Q_spec_serv_hdr{
        get {
            if(!this.HasProp("__Q_spec_serv_hdr"))
                this.__Q_spec_serv_hdr := IntServServiceHdr(this.ptr + 0)
            return this.__Q_spec_serv_hdr
        }
    }

    /**
     * Parameter header, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    Q_spec_parm_hdr{
        get {
            if(!this.HasProp("__Q_spec_parm_hdr"))
                this.__Q_spec_parm_hdr := IntServParmHdr(this.ptr + 4)
            return this.__Q_spec_parm_hdr
        }
    }

    /**
     * QUALITATIVE Tspec parameters, expressed as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-qualtspecparms">QualTspecParms</a> structure.
     * @type {Integer}
     */
    Q_spec_parms {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
