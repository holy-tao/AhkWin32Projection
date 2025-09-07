#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IntServMainHdr.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk
#Include .\GenTspecParms.ahk
#Include .\GenTspec.ahk
#Include .\QualTspec.ahk

/**
 * The IntServTspecBody structure contains information for an RSVP Tspec.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-intservtspecbody
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IntServTspecBody extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Header for the corresponding Tspec object, expressed as  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservmainhdr">IntServMainHdr</a> structure.
     * @type {IntServMainHdr}
     */
    st_mh{
        get {
            if(!this.HasProp("__st_mh"))
                this.__st_mh := IntServMainHdr(this.ptr + 0)
            return this.__st_mh
        }
    }

    /**
     * @type {GenTspec}
     */
    gen_stspec{
        get {
            if(!this.HasProp("__gen_stspec"))
                this.__gen_stspec := GenTspec(this.ptr + 8)
            return this.__gen_stspec
        }
    }

    /**
     * @type {QualTspec}
     */
    qual_stspec{
        get {
            if(!this.HasProp("__qual_stspec"))
                this.__qual_stspec := QualTspec(this.ptr + 8)
            return this.__qual_stspec
        }
    }
}
