#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include .\IKEV2_TUNNEL_CONFIG_PARAMS4.ahk
#Include .\IKEV2_CONFIG_PARAMS.ahk
#Include .\PPTP_CONFIG_PARAMS.ahk
#Include .\L2TP_TUNNEL_CONFIG_PARAMS2.ahk
#Include .\L2TP_CONFIG_PARAMS1.ahk
#Include .\SSTP_CERT_INFO.ahk
#Include .\SSTP_CONFIG_PARAMS.ahk
#Include .\GRE_CONFIG_PARAMS0.ahk

/**
 * Used to get or set configuration of tunnel parameters on a RAS Server.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mprapi_tunnel_config_params1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPRAPI_TUNNEL_CONFIG_PARAMS1 extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ikev2_config_params">IKEV2_CONFIG_PARAMS</a> structure that contains Internet Key Exchange version 2 (IKEv2) tunnel parameters.
     * @type {IKEV2_CONFIG_PARAMS}
     */
    IkeConfigParams{
        get {
            if(!this.HasProp("__IkeConfigParams"))
                this.__IkeConfigParams := IKEV2_CONFIG_PARAMS(0, this)
            return this.__IkeConfigParams
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-pptp_config_params">PPTP_CONFIG_PARAMS</a> structure that contains Point-to-Point Tunneling Protocol (PPTP) tunnel parameters.
     * @type {PPTP_CONFIG_PARAMS}
     */
    PptpConfigParams{
        get {
            if(!this.HasProp("__PptpConfigParams"))
                this.__PptpConfigParams := PPTP_CONFIG_PARAMS(120, this)
            return this.__PptpConfigParams
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-l2tp_config_params0">L2TP_CONFIG_PARAMS</a> structure that contains Layer 2 Tunneling Protocol (L2TP) tunnel parameters.
     * @type {L2TP_CONFIG_PARAMS1}
     */
    L2tpConfigParams{
        get {
            if(!this.HasProp("__L2tpConfigParams"))
                this.__L2tpConfigParams := L2TP_CONFIG_PARAMS1(128, this)
            return this.__L2tpConfigParams
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-sstp_config_params">SSTP_CONFIG_PARAMS</a> structure that contains Secure Socket Tunneling Protocol (SSTP) tunnel parameters.
     * @type {SSTP_CONFIG_PARAMS}
     */
    SstpConfigParams{
        get {
            if(!this.HasProp("__SstpConfigParams"))
                this.__SstpConfigParams := SSTP_CONFIG_PARAMS(176, this)
            return this.__SstpConfigParams
        }
    }

    /**
     * 
     * @type {GRE_CONFIG_PARAMS0}
     */
    GREConfigParams{
        get {
            if(!this.HasProp("__GREConfigParams"))
                this.__GREConfigParams := GRE_CONFIG_PARAMS0(216, this)
            return this.__GREConfigParams
        }
    }
}
