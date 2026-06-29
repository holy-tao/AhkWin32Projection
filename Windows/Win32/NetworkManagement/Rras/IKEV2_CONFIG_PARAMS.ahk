#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\IKEV2_TUNNEL_CONFIG_PARAMS4.ahk" { IKEV2_TUNNEL_CONFIG_PARAMS4 }
#Import ".\MPR_CERT_EKU.ahk" { MPR_CERT_EKU }

/**
 * Used to get or set parameters for Internet Key Exchange version 2 (IKEv2) devices (RFC 4306).
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ikev2_config_params
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct IKEV2_CONFIG_PARAMS {
    #StructPack 8

    /**
     * A value that specifies the number of ports configured on the RRAS server to accept IKEv2 connections.
     */
    dwNumPorts : UInt32

    /**
     * A value that specifies the type of ports configured on the  RRAS server for IKEv2. The following values are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPR_ENABLE_RAS_ON_DEVICE"></a><a id="mpr_enable_ras_on_device"></a><dl>
     * <dt><b>MPR_ENABLE_RAS_ON_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remote Access is enabled for IKEv2.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwPortFlags : UInt32

    /**
     * A value that specifies if the user is able to set the tunnel configuration parameters. The following values are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_IKEV2_SET_TUNNEL_CONFIG_PARAMS"></a><a id="mprapi_ikev2_set_tunnel_config_params"></a><dl>
     * <dt><b>MPRAPI_IKEV2_SET_TUNNEL_CONFIG_PARAMS</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the <b>dwNumPorts</b>, <b>dwPortFlags</b>, and <b>TunnelConfigParams</b> fields are valid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwTunnelConfigParamFlags : UInt32

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/RRAS/router-management-data-types">IKEV2_TUNNEL_CONFIG_PARAMS</a> structure that contains IKEv2 tunnel information.
     */
    TunnelConfigParams : IKEV2_TUNNEL_CONFIG_PARAMS4

}
