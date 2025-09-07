#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk
#Include .\GenTspecParms.ahk

/**
 * The GenTspec structure stores generic Tspec information.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-gentspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class GenTspec extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * General information and length information for the GenTspec object (this structure), expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservservicehdr">IntServServiceHdr</a> structure.
     * @type {IntServServiceHdr}
     */
    gen_Tspec_serv_hdr{
        get {
            if(!this.HasProp("__gen_Tspec_serv_hdr"))
                this.__gen_Tspec_serv_hdr := IntServServiceHdr(this.ptr + 0)
            return this.__gen_Tspec_serv_hdr
        }
    }

    /**
     * Parameter header, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    gen_Tspec_parm_hdr{
        get {
            if(!this.HasProp("__gen_Tspec_parm_hdr"))
                this.__gen_Tspec_parm_hdr := IntServParmHdr(this.ptr + 4)
            return this.__gen_Tspec_parm_hdr
        }
    }

    /**
     * Tspec parameters, expressed as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-gentspecparms">GenTspecParms</a> structure.
     * @type {GenTspecParms}
     */
    gen_Tspec_parms{
        get {
            if(!this.HasProp("__gen_Tspec_parms"))
                this.__gen_Tspec_parms := GenTspecParms(this.ptr + 8)
            return this.__gen_Tspec_parms
        }
    }
}
