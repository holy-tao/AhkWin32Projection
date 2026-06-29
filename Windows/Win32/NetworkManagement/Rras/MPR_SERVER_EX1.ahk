#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEV2_CONFIG_PARAMS.ahk" { IKEV2_CONFIG_PARAMS }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\L2TP_TUNNEL_CONFIG_PARAMS2.ahk" { L2TP_TUNNEL_CONFIG_PARAMS2 }
#Import ".\MPR_CERT_EKU.ahk" { MPR_CERT_EKU }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SSTP_CONFIG_PARAMS.ahk" { SSTP_CONFIG_PARAMS }
#Import ".\MPRAPI_TUNNEL_CONFIG_PARAMS1.ahk" { MPRAPI_TUNNEL_CONFIG_PARAMS1 }
#Import ".\L2TP_CONFIG_PARAMS1.ahk" { L2TP_CONFIG_PARAMS1 }
#Import ".\IKEV2_TUNNEL_CONFIG_PARAMS4.ahk" { IKEV2_TUNNEL_CONFIG_PARAMS4 }
#Import ".\PPTP_CONFIG_PARAMS.ahk" { PPTP_CONFIG_PARAMS }
#Import ".\SSTP_CERT_INFO.ahk" { SSTP_CERT_INFO }
#Import ".\GRE_CONFIG_PARAMS0.ahk" { GRE_CONFIG_PARAMS0 }
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import ".\MPRAPI_OBJECT_HEADER.ahk" { MPRAPI_OBJECT_HEADER }

/**
 * Used to get or set the configuration of a RAS server. (MPR_SERVER_EX1)
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_server_ex1
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_SERVER_EX1 {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>MPR_SERVER_EX</b> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>MPRAPI_MPR_SERVER_OBJECT_REVISION_1</b>  and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_MPR_SERVER_OBJECT</b>.</div>
     * <div> </div>
     */
    Header : MPRAPI_OBJECT_HEADER

    /**
     * A BOOL that is <b>TRUE</b> if the RRAS server is running in LAN-only mode and <b>FALSE</b> if it is functioning as a router.
     */
    fLanOnlyMode : UInt32

    /**
     * A value that specifies the elapsed time, in seconds, since the RAS server was started.
     */
    dwUpTime : UInt32

    /**
     * A value that specifies the number of ports on the RAS server.
     */
    dwTotalPorts : UInt32

    /**
     * A value that specifies the number of ports currently in use on the RAS server.
     */
    dwPortsInUse : UInt32

    /**
     * Reserved. This value must be zero.
     */
    Reserved : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_tunnel_config_params0">MPRAPI_TUNNEL_CONFIG_PARAMS</a> structure that contains Point-to-Point (PPTP), Secure Socket Tunneling Protocol (SSTP), Layer 2 Tunneling Protocol (L2TP), and Internet Key version 2 (IKEv2) tunnel configuration information for the RAS server.
     */
    ConfigParams : MPRAPI_TUNNEL_CONFIG_PARAMS1

}
