#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PARAM_BUFFER.ahk" { PARAM_BUFFER }
#Import ".\AD_GENERAL_PARAMS.ahk" { AD_GENERAL_PARAMS }
#Import ".\AD_GUARANTEED.ahk" { AD_GUARANTEED }

/**
 * The CONTROL_SERVICE structure contains supported RSVP service types.
 * @remarks
 * The <b>Length</b> value can be added to the pointer to the structure to obtain the pointer to the next <b>CONTROL_SERVICE</b> structure in the list, until the <b>NumberOfServices</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_adspec">RSVP_ADSPEC</a> structure is exhausted.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-control_service
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct CONTROL_SERVICE {
    #StructPack 4

    /**
     * Length of the entire structure, in bytes.
     */
    Length : UInt32

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
     */
    Service : UInt32

    /**
     * Specifies overrides to service specifications, expressed in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-ad_general_params">AD_GENERAL_PARAMS</a> structure.
     */
    Overrides : AD_GENERAL_PARAMS

    Guaranteed : AD_GUARANTEED

    static __New() {
        DefineProp(this.Prototype, 'ParamBuffer', { type: PARAM_BUFFER[1], offset: 28 })
        this.DeleteProp("__New")
    }
}
