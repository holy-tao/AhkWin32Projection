#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AD_GENERAL_PARAMS.ahk
#Include .\AD_GUARANTEED.ahk
#Include .\PARAM_BUFFER.ahk

/**
 * The CONTROL_SERVICE structure contains supported RSVP service types.
 * @remarks
 * 
  * The <b>Length</b> value can be added to the pointer to the structure to obtain the pointer to the next <b>CONTROL_SERVICE</b> structure in the list, until the <b>NumberOfServices</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_adspec">RSVP_ADSPEC</a> structure is exhausted.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qossp/ns-qossp-control_service
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class CONTROL_SERVICE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Length of the entire structure, in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The supported service type. Must be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_NOTRAFFIC"></a><a id="servicetype_notraffic"></a><dl>
     * <dt><b>SERVICETYPE_NOTRAFFIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data is being sent in this direction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_BESTEFFORT"></a><a id="servicetype_besteffort"></a><dl>
     * <dt><b>SERVICETYPE_BESTEFFORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Best Effort service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_CONTROLLEDLOAD"></a><a id="servicetype_controlledload"></a><dl>
     * <dt><b>SERVICETYPE_CONTROLLEDLOAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Controlled Load service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_GUARANTEED"></a><a id="servicetype_guaranteed"></a><dl>
     * <dt><b>SERVICETYPE_GUARANTEED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Guaranteed service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_NETWORK_UNAVAILABLE"></a><a id="servicetype_network_unavailable"></a><dl>
     * <dt><b>SERVICETYPE_NETWORK_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This service type is used to notify the user that the network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_GENERAL_INFORMATION"></a><a id="servicetype_general_information"></a><dl>
     * <dt><b>SERVICETYPE_GENERAL_INFORMATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This service type corresponds to General Parameters, as defined by IntServ (the Integrated Services Working Group in the IETF).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_NOCHANGE"></a><a id="servicetype_nochange"></a><dl>
     * <dt><b>SERVICETYPE_NOCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This specifies that the flow specification contains no changes from the previous specification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_NONCONFORMING"></a><a id="servicetype_nonconforming"></a><dl>
     * <dt><b>SERVICETYPE_NONCONFORMING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies non-conforming traffic.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_NETWORK_CONTROL"></a><a id="servicetype_network_control"></a><dl>
     * <dt><b>SERVICETYPE_NETWORK_CONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies network control traffic.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICETYPE_QUALITATIVE"></a><a id="servicetype_qualitative"></a><dl>
     * <dt><b>SERVICETYPE_QUALITATIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Qualitative service.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Service {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies overrides to service specifications, expressed in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-ad_general_params">AD_GENERAL_PARAMS</a> structure.
     * @type {AD_GENERAL_PARAMS}
     */
    Overrides{
        get {
            if(!this.HasProp("__Overrides"))
                this.__Overrides := AD_GENERAL_PARAMS(8, this)
            return this.__Overrides
        }
    }

    /**
     * @type {AD_GUARANTEED}
     */
    Guaranteed{
        get {
            if(!this.HasProp("__Guaranteed"))
                this.__Guaranteed := AD_GUARANTEED(32, this)
            return this.__Guaranteed
        }
    }

    /**
     * @type {Array<PARAM_BUFFER>}
     */
    ParamBuffer{
        get {
            if(!this.HasProp("__ParamBufferProxyArray"))
                this.__ParamBufferProxyArray := Win32FixedArray(this.ptr + 32, 1, PARAM_BUFFER, "")
            return this.__ParamBufferProxyArray
        }
    }
}
