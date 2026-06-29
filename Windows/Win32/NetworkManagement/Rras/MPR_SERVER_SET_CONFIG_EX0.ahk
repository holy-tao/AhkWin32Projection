#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEV2_CONFIG_PARAMS.ahk" { IKEV2_CONFIG_PARAMS }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\L2TP_TUNNEL_CONFIG_PARAMS2.ahk" { L2TP_TUNNEL_CONFIG_PARAMS2 }
#Import ".\MPR_CERT_EKU.ahk" { MPR_CERT_EKU }
#Import ".\MPRAPI_TUNNEL_CONFIG_PARAMS0.ahk" { MPRAPI_TUNNEL_CONFIG_PARAMS0 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SSTP_CONFIG_PARAMS.ahk" { SSTP_CONFIG_PARAMS }
#Import ".\L2TP_CONFIG_PARAMS1.ahk" { L2TP_CONFIG_PARAMS1 }
#Import ".\IKEV2_TUNNEL_CONFIG_PARAMS4.ahk" { IKEV2_TUNNEL_CONFIG_PARAMS4 }
#Import ".\PPTP_CONFIG_PARAMS.ahk" { PPTP_CONFIG_PARAMS }
#Import ".\SSTP_CERT_INFO.ahk" { SSTP_CERT_INFO }
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import ".\MPRAPI_OBJECT_HEADER.ahk" { MPRAPI_OBJECT_HEADER }

/**
 * Used to get or set the tunnel configuration information of a RAS server. (MPR_SERVER_SET_CONFIG_EX0)
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_server_set_config_ex0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_SERVER_SET_CONFIG_EX0 {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>MPR_SERVER_SET_CONFIG_EX</b> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_1</b> and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_MPR_SERVER_SET_CONFIG_OBJECT</b>.</div>
     * <div> </div>
     */
    Header : MPRAPI_OBJECT_HEADER

    /**
     * A value that specifies the tunnel type in <b>ConfigParams</b>. The following tunnel types are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_SET_CONFIG_PROTOCOL_FOR_PPTP_________________"></a><a id="mprapi_set_config_protocol_for_pptp_________________"></a><dl>
     * <dt><b>MPRAPI_SET_CONFIG_PROTOCOL_FOR_PPTP                 </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Point-to-Point Protocol (PPTP)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_SET_CONFIG_PROTOCOL_FOR_L2TP_________________"></a><a id="mprapi_set_config_protocol_for_l2tp_________________"></a><dl>
     * <dt><b>MPRAPI_SET_CONFIG_PROTOCOL_FOR_L2TP                 </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Layer 2 Tunneling Protocol (L2TP)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_SET_CONFIG_PROTOCOL_FOR_SSTP_________________"></a><a id="mprapi_set_config_protocol_for_sstp_________________"></a><dl>
     * <dt><b>MPRAPI_SET_CONFIG_PROTOCOL_FOR_SSTP                 </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Socket Tunneling Protocol (SSTP)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_SET_CONFIG_PROTOCOL_FOR_IKEV2_________________"></a><a id="mprapi_set_config_protocol_for_ikev2_________________"></a><dl>
     * <dt><b>MPRAPI_SET_CONFIG_PROTOCOL_FOR_IKEV2                 </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internet Key version 2 (IKEV2)
     * 
     * </td>
     * </tr>
     * </table>
     */
    setConfigForProtocols : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_tunnel_config_params0">MPRAPI_TUNNEL_CONFIG_PARAMS</a> structure that contains the tunnel configuration information for the tunnel type specified in <b>setConfigForProtocols</b>.
     */
    ConfigParams : MPRAPI_TUNNEL_CONFIG_PARAMS0

}
