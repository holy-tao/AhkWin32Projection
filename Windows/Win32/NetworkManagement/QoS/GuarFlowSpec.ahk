#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk
#Include .\GenTspecParms.ahk
#Include .\GuarRspec.ahk

/**
 * The GuarFlowSpec structure contains guaranteed flowspec information.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-guarflowspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class GuarFlowSpec extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * General information and length information for the guaranteed flowspec object (this structure), expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservservicehdr">IntServServiceHdr</a> structure.
     * @type {IntServServiceHdr}
     */
    Guar_serv_hdr{
        get {
            if(!this.HasProp("__Guar_serv_hdr"))
                this.__Guar_serv_hdr := IntServServiceHdr(this.ptr + 0)
            return this.__Guar_serv_hdr
        }
    }

    /**
     * Parameter header for the guaranteed Tspec, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    Guar_Tspec_hdr{
        get {
            if(!this.HasProp("__Guar_Tspec_hdr"))
                this.__Guar_Tspec_hdr := IntServParmHdr(this.ptr + 4)
            return this.__Guar_Tspec_hdr
        }
    }

    /**
     * Generic Tspec  parameters, expressed as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-gentspecparms">GenTspecParms</a> structure.
     * @type {GenTspecParms}
     */
    Guar_Tspec_parms{
        get {
            if(!this.HasProp("__Guar_Tspec_parms"))
                this.__Guar_Tspec_parms := GenTspecParms(this.ptr + 8)
            return this.__Guar_Tspec_parms
        }
    }

    /**
     * Parameter header for the guaranteed Rspec, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    Guar_Rspec_hdr{
        get {
            if(!this.HasProp("__Guar_Rspec_hdr"))
                this.__Guar_Rspec_hdr := IntServParmHdr(this.ptr + 28)
            return this.__Guar_Rspec_hdr
        }
    }

    /**
     * Guaranteed rate, in bytes per second, expressed as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-guarrspec">GuarRspec</a> structure.
     * @type {GuarRspec}
     */
    Guar_Rspec{
        get {
            if(!this.HasProp("__Guar_Rspec"))
                this.__Guar_Rspec := GuarRspec(this.ptr + 32)
            return this.__Guar_Rspec
        }
    }
}
