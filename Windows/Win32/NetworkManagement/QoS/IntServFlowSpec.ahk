#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IntServMainHdr.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk
#Include .\GenTspecParms.ahk
#Include .\CtrlLoadFlowspec.ahk
#Include .\GuarRspec.ahk
#Include .\GuarFlowSpec.ahk
#Include .\QualAppFlowSpec.ahk

/**
 * The IntServFlowSpec structure contains information about Integrated Services flowspecs.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-intservflowspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IntServFlowSpec extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * General information and length information for the  flowspec object (this structure), expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservmainhdr">IntServMainHdr</a> structure.
     * @type {IntServMainHdr}
     */
    spec_mh{
        get {
            if(!this.HasProp("__spec_mh"))
                this.__spec_mh := IntServMainHdr(this.ptr + 0)
            return this.__spec_mh
        }
    }

    /**
     * @type {CtrlLoadFlowspec}
     */
    CL_spec{
        get {
            if(!this.HasProp("__CL_spec"))
                this.__CL_spec := CtrlLoadFlowspec(this.ptr + 8)
            return this.__CL_spec
        }
    }

    /**
     * @type {GuarFlowSpec}
     */
    G_spec{
        get {
            if(!this.HasProp("__G_spec"))
                this.__G_spec := GuarFlowSpec(this.ptr + 8)
            return this.__G_spec
        }
    }

    /**
     * @type {QualAppFlowSpec}
     */
    Q_spec{
        get {
            if(!this.HasProp("__Q_spec"))
                this.__Q_spec := QualAppFlowSpec(this.ptr + 8)
            return this.__Q_spec
        }
    }
}
