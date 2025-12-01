#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include .\SSTP_CERT_INFO.ahk

/**
 * Used to get and set the device configuration for Secure Socket Tunneling Protocol (SSTP) on a RAS Server.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-sstp_config_params
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class SSTP_CONFIG_PARAMS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A value that specifies the number of ports configured on the RRAS server to accept SSTP connections. The maximum values for <b>dwNumPorts</b> are listed in the following table. The value zero is not allowed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Web Server 2008
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2008 Standard
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>30000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2008 Datacenter and Windows Server 2008 Enterprise
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  If <b>dwNumPorts</b> contains a value beyond the limit configured in the registry at service start time (the default is 1000 for Windows Server 2008 Standard and Windows Server 2008 Enterprise), the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigservergetinfoex">MprConfigServerGetInfoEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfoex">MprConfigServerSetInfoEx</a> functions will return <b>ERROR_SUCCESS_REBOOT_REQUIRED</b>.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwNumPorts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies the type of ports configured on the  RRAS server for SSTP. The following values are supported:
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
     * If set, RAS is enabled on the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwPortFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value that is <b>TRUE</b> if HTTPS is used and <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    isUseHttps {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A value that specifies the certificate hashing algorithm used. The following values are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_SHA_256"></a><a id="calg_sha_256"></a><dl>
     * <dt><b>CALG_SHA_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 256-bit SHA hashing algorithm
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    certAlgorithm {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-sstp_cert_info">SSTP_CERT_INFO</a> structure that contains the SSTP based certificate hash.
     * @type {SSTP_CERT_INFO}
     */
    sstpCertDetails{
        get {
            if(!this.HasProp("__sstpCertDetails"))
                this.__sstpCertDetails := SSTP_CERT_INFO(16, this)
            return this.__sstpCertDetails
        }
    }
}
