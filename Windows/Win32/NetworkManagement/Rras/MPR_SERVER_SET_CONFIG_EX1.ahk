#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MPRAPI_OBJECT_HEADER.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include .\IKEV2_TUNNEL_CONFIG_PARAMS4.ahk
#Include .\IKEV2_CONFIG_PARAMS.ahk
#Include .\PPTP_CONFIG_PARAMS.ahk
#Include .\L2TP_TUNNEL_CONFIG_PARAMS2.ahk
#Include .\L2TP_CONFIG_PARAMS1.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\SSTP_CERT_INFO.ahk
#Include .\SSTP_CONFIG_PARAMS.ahk
#Include .\GRE_CONFIG_PARAMS0.ahk
#Include .\MPRAPI_TUNNEL_CONFIG_PARAMS1.ahk

/**
 * Used to get or set the tunnel configuration information of a RAS server.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_server_set_config_ex1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_SERVER_SET_CONFIG_EX1 extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>MPR_SERVER_SET_CONFIG_EX</b> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_1</b> and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_MPR_SERVER_SET_CONFIG_OBJECT</b>.</div>
     * <div> </div>
     * @type {MPRAPI_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := MPRAPI_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

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
     * @type {Integer}
     */
    setConfigForProtocols {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_tunnel_config_params0">MPRAPI_TUNNEL_CONFIG_PARAMS</a> structure that contains the tunnel configuration information for the tunnel type specified in <b>setConfigForProtocols</b>.
     * @type {MPRAPI_TUNNEL_CONFIG_PARAMS1}
     */
    ConfigParams{
        get {
            if(!this.HasProp("__ConfigParams"))
                this.__ConfigParams := MPRAPI_TUNNEL_CONFIG_PARAMS1(this.ptr + 8)
            return this.__ConfigParams
        }
    }
}
