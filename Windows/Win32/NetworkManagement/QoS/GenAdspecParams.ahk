#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk

/**
 * The GenAdspecParams structure contains general path characterization parameters.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-genadspecparams
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class GenAdspecParams extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * General information and length information for the Adspec parameters object (this structure), expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservservicehdr">IntServServiceHdr</a> structure.
     * @type {IntServServiceHdr}
     */
    gen_parm_hdr{
        get {
            if(!this.HasProp("__gen_parm_hdr"))
                this.__gen_parm_hdr := IntServServiceHdr(this.ptr + 0)
            return this.__gen_parm_hdr
        }
    }

    /**
     * Parameter header for hop count information associated with the Adspec object, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    gen_parm_hopcnt_hdr{
        get {
            if(!this.HasProp("__gen_parm_hopcnt_hdr"))
                this.__gen_parm_hopcnt_hdr := IntServParmHdr(this.ptr + 4)
            return this.__gen_parm_hopcnt_hdr
        }
    }

    /**
     * Hop count information parameter.
     * @type {Integer}
     */
    gen_parm_hopcnt {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Parameter header for path bandwidth information associated with the Adspec object, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    gen_parm_pathbw_hdr{
        get {
            if(!this.HasProp("__gen_parm_pathbw_hdr"))
                this.__gen_parm_pathbw_hdr := IntServParmHdr(this.ptr + 12)
            return this.__gen_parm_pathbw_hdr
        }
    }

    /**
     * Path bandwidth information parameter.
     * @type {Float}
     */
    gen_parm_path_bw {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Parameter header for minimum latency information associated with the Adspec object, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    gen_parm_minlat_hdr{
        get {
            if(!this.HasProp("__gen_parm_minlat_hdr"))
                this.__gen_parm_minlat_hdr := IntServParmHdr(this.ptr + 20)
            return this.__gen_parm_minlat_hdr
        }
    }

    /**
     * Minimum latency information parameter.
     * @type {Integer}
     */
    gen_parm_min_latency {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Parameter header for composed maximum transmission unit (MTU) information associated with the Adspec object, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservparmhdr">IntServParmHdr</a> structure.
     * @type {IntServParmHdr}
     */
    gen_parm_compmtu_hdr{
        get {
            if(!this.HasProp("__gen_parm_compmtu_hdr"))
                this.__gen_parm_compmtu_hdr := IntServParmHdr(this.ptr + 28)
            return this.__gen_parm_compmtu_hdr
        }
    }

    /**
     * Composed MTU information parameter.
     * @type {Integer}
     */
    gen_parm_composed_MTU {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
