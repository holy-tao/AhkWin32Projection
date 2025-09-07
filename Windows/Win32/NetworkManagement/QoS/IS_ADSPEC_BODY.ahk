#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IntServMainHdr.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk
#Include .\GenAdspecParams.ahk

/**
 * The IS_ADSPEC_BODY structure contains Integrated Services Adspec information.
 * @remarks
 * The variable-length fragments that follow the <b>adspec_genparams</b> member can be minimal length fragments.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-is_adspec_body
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IS_ADSPEC_BODY extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Main header information and length, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservmainhdr">IntServMainHdr</a> structure.
     * @type {IntServMainHdr}
     */
    adspec_mh{
        get {
            if(!this.HasProp("__adspec_mh"))
                this.__adspec_mh := IntServMainHdr(this.ptr + 0)
            return this.__adspec_mh
        }
    }

    /**
     * General Adspec parameter fragment, followed by variable-length fragments for some or all services.
     * @type {GenAdspecParams}
     */
    adspec_genparms{
        get {
            if(!this.HasProp("__adspec_genparms"))
                this.__adspec_genparms := GenAdspecParams(this.ptr + 8)
            return this.__adspec_genparms
        }
    }
}
