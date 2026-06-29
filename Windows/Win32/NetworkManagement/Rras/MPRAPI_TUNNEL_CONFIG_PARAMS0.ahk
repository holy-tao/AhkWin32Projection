#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEV2_CONFIG_PARAMS.ahk" { IKEV2_CONFIG_PARAMS }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\L2TP_TUNNEL_CONFIG_PARAMS2.ahk" { L2TP_TUNNEL_CONFIG_PARAMS2 }
#Import ".\MPR_CERT_EKU.ahk" { MPR_CERT_EKU }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SSTP_CONFIG_PARAMS.ahk" { SSTP_CONFIG_PARAMS }
#Import ".\L2TP_CONFIG_PARAMS1.ahk" { L2TP_CONFIG_PARAMS1 }
#Import ".\IKEV2_TUNNEL_CONFIG_PARAMS4.ahk" { IKEV2_TUNNEL_CONFIG_PARAMS4 }
#Import ".\PPTP_CONFIG_PARAMS.ahk" { PPTP_CONFIG_PARAMS }
#Import ".\SSTP_CERT_INFO.ahk" { SSTP_CERT_INFO }
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }

/**
 * Used to get or set configuration of tunnel parameters on a RAS Server. (MPRAPI_TUNNEL_CONFIG_PARAMS0)
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mprapi_tunnel_config_params0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPRAPI_TUNNEL_CONFIG_PARAMS0 {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ikev2_config_params">IKEV2_CONFIG_PARAMS</a> structure that contains Internet Key Exchange version 2 (IKEv2) tunnel parameters.
     */
    IkeConfigParams : IKEV2_CONFIG_PARAMS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-pptp_config_params">PPTP_CONFIG_PARAMS</a> structure that contains Point-to-Point Tunneling Protocol (PPTP) tunnel parameters.
     */
    PptpConfigParams : PPTP_CONFIG_PARAMS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-l2tp_config_params0">L2TP_CONFIG_PARAMS</a> structure that contains Layer 2 Tunneling Protocol (L2TP) tunnel parameters.
     */
    L2tpConfigParams : L2TP_CONFIG_PARAMS1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-sstp_config_params">SSTP_CONFIG_PARAMS</a> structure that contains Secure Socket Tunneling Protocol (SSTP) tunnel parameters.
     */
    SstpConfigParams : SSTP_CONFIG_PARAMS

}
