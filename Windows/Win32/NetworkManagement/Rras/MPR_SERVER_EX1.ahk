#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MPRAPI_OBJECT_HEADER.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include .\IKEV2_TUNNEL_CONFIG_PARAMS4.ahk
#Include .\IKEV2_CONFIG_PARAMS.ahk
#Include .\PPTP_CONFIG_PARAMS.ahk
#Include .\L2TP_TUNNEL_CONFIG_PARAMS2.ahk
#Include .\L2TP_CONFIG_PARAMS1.ahk
#Include .\SSTP_CERT_INFO.ahk
#Include .\SSTP_CONFIG_PARAMS.ahk
#Include .\GRE_CONFIG_PARAMS0.ahk
#Include .\MPRAPI_TUNNEL_CONFIG_PARAMS1.ahk

/**
 * Used to get or set the configuration of a RAS server.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_server_ex1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_SERVER_EX1 extends Win32Struct
{
    static sizeof => 248

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>MPR_SERVER_EX</b> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>MPRAPI_MPR_SERVER_OBJECT_REVISION_1</b>  and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_MPR_SERVER_OBJECT</b>.</div>
     * <div> </div>
     * @type {MPRAPI_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := MPRAPI_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * A BOOL that is <b>TRUE</b> if the RRAS server is running in LAN-only mode and <b>FALSE</b> if it is functioning as a router.
     * @type {Integer}
     */
    fLanOnlyMode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value that specifies the elapsed time, in seconds, since the RAS server was started.
     * @type {Integer}
     */
    dwUpTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A value that specifies the number of ports on the RAS server.
     * @type {Integer}
     */
    dwTotalPorts {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A value that specifies the number of ports currently in use on the RAS server.
     * @type {Integer}
     */
    dwPortsInUse {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved. This value must be zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_tunnel_config_params0">MPRAPI_TUNNEL_CONFIG_PARAMS</a> structure that contains Point-to-Point (PPTP), Secure Socket Tunneling Protocol (SSTP), Layer 2 Tunneling Protocol (L2TP), and Internet Key version 2 (IKEv2) tunnel configuration information for the RAS server.
     * @type {MPRAPI_TUNNEL_CONFIG_PARAMS1}
     */
    ConfigParams{
        get {
            if(!this.HasProp("__ConfigParams"))
                this.__ConfigParams := MPRAPI_TUNNEL_CONFIG_PARAMS1(24, this)
            return this.__ConfigParams
        }
    }
}
