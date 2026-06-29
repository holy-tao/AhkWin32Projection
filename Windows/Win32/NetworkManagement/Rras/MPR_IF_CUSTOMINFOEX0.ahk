#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\ROUTER_IKEv2_IF_CUSTOM_CONFIG0.ahk" { ROUTER_IKEv2_IF_CUSTOM_CONFIG0 }
#Import ".\MPRAPI_OBJECT_HEADER.ahk" { MPRAPI_OBJECT_HEADER }

/**
 * Gets or sets tunnel specific custom configuration for a demand dial interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_if_custominfoex0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_IF_CUSTOMINFOEX0 {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>MPR_IF_CUSTOMINFOEX0</b> structure.
     */
    Header : MPRAPI_OBJECT_HEADER

    /**
     * A value that specifies the tunnel type for which the custom configuration is available. The following values are supported.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No custom configuration available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_IF_CUSTOM_CONFIG_FOR_IKEV2_"></a><a id="mprapi_if_custom_config_for_ikev2_"></a><dl>
     * <dt><b>MPRAPI_IF_CUSTOM_CONFIG_FOR_IKEV2 </b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IKEv2 tunnel specific configuration is available.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-router_ikev2_if_custom_config0">ROUTER_IKEv2_IF_CUSTOM_CONFIG0</a> structure that specifies the IKEv2 tunnel configuration parameters.
     */
    customIkev2Config : ROUTER_IKEv2_IF_CUSTOM_CONFIG0

}
