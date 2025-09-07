#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RsvpObjHdr.ahk
#Include .\IntServMainHdr.ahk
#Include .\IntServServiceHdr.ahk
#Include .\IntServParmHdr.ahk
#Include .\GenTspecParms.ahk
#Include .\CtrlLoadFlowspec.ahk
#Include .\GuarRspec.ahk
#Include .\GuarFlowSpec.ahk
#Include .\QualAppFlowSpec.ahk
#Include .\IntServFlowSpec.ahk

/**
 * The IS_FLOWSPEC structure stores an Integrated Services FLOWSPEC object.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-is_flowspec
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IS_FLOWSPEC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * General information and length information for the Integrated Services flowspec object (this structure), expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-rsvpobjhdr">RsvpObjHdr</a> structure.
     * @type {RsvpObjHdr}
     */
    flow_header{
        get {
            if(!this.HasProp("__flow_header"))
                this.__flow_header := RsvpObjHdr(this.ptr + 0)
            return this.__flow_header
        }
    }

    /**
     * FLOWSPEC object data, expressed as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/ns-lpmapi-intservflowspec">IntServFlowSpec</a> structure.
     * @type {IntServFlowSpec}
     */
    flow_body{
        get {
            if(!this.HasProp("__flow_body"))
                this.__flow_body := IntServFlowSpec(this.ptr + 8)
            return this.__flow_body
        }
    }
}
