#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk

/**
 * The Gads_parms_t structure stores guaranteed service Adspec parameters.
 * @remarks
 * This object may be followed by override general parameter values.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-gads_parms_t
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class Gads_parms_t extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * General information and length information for the guaranteed service Adspec object (this structure), expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservservicehdr">IntServServiceHdr</a> structure.
     * @type {IntServServiceHdr}
     */
    Gads_serv_hdr{
        get {
            if(!this.HasProp("__Gads_serv_hdr"))
                this.__Gads_serv_hdr := IntServServiceHdr(this.ptr + 0)
            return this.__Gads_serv_hdr
        }
    }

    /**
     * Parameter header for the guaranteed service Adspec, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    Gads_Ctot_hdr{
        get {
            if(!this.HasProp("__Gads_Ctot_hdr"))
                this.__Gads_Ctot_hdr := IntServParmHdr(this.ptr + 4)
            return this.__Gads_Ctot_hdr
        }
    }

    /**
     * Parameter associated with <b>Gads_Ctot_hdr</b>.
     * @type {Integer}
     */
    Gads_Ctot {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Parameter header for the guaranteed service Adspec, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    Gads_Dtot_hdr{
        get {
            if(!this.HasProp("__Gads_Dtot_hdr"))
                this.__Gads_Dtot_hdr := IntServParmHdr(this.ptr + 12)
            return this.__Gads_Dtot_hdr
        }
    }

    /**
     * Parameter associated with <b>Gads_Dtot_hdr</b>.
     * @type {Integer}
     */
    Gads_Dtot {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Parameter header for the guaranteed service Adspec, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    Gads_Csum_hdr{
        get {
            if(!this.HasProp("__Gads_Csum_hdr"))
                this.__Gads_Csum_hdr := IntServParmHdr(this.ptr + 20)
            return this.__Gads_Csum_hdr
        }
    }

    /**
     * Parameter associated with <b>Gads_Csum</b>.
     * @type {Integer}
     */
    Gads_Csum {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Parameter header for the guaranteed service Adspec, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    Gads_Dsum_hdr{
        get {
            if(!this.HasProp("__Gads_Dsum_hdr"))
                this.__Gads_Dsum_hdr := IntServParmHdr(this.ptr + 28)
            return this.__Gads_Dsum_hdr
        }
    }

    /**
     * Parameter associated with <b>Gads_Dsum</b>.
     * @type {Integer}
     */
    Gads_Dsum {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
