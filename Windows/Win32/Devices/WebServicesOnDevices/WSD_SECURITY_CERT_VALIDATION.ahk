#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\HCERTSTORE.ahk

/**
 * Represents the criteria for matching client certificates against those of an HTTPS server.
 * @remarks
 * 
  * This structure is used in the <b>pConfigData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_param">WSD_CONFIG_PARAM</a> structure. 
  * 
  * When the <b>configParamType</b> of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_param">WSD_CONFIG_PARAM</a> is <b>WSD_SECURITY_SSL_SERVER_CERT_VALIDATION</b>, this structure can be used to validate SSL server certificates presented by an SSL server.
  * 
  * 
  * 
  * When the <b>configParamType</b> of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_param">WSD_CONFIG_PARAM</a> is <b>WSD_SECURITY_SSL_CLIENT_CERT_VALIDATION</b>, this structure can be used to validate SSL client certificates presented by an SSL client.
  * 
  * <b>WSD_SECURITY_CERT_VALIDATION</b> defines 3 certificate matching mechanisms.  To obtain a match, at least one such mechanism must be satisfied.
  * 
  * If the application is built using Windows 8 SDK targeted for Windows 8 OS, <b>WSD_SECURITY_CERT_VALIDATION</b> resolves into the new structure. However, as a result, the application can then only run on Windows 8 machines.
  * 
  * If the application is built using Windows 8 SDK targeted for Windows 7 OS, <b>WSD_SECURITY_CERT_VALIDATION</b> will resolve into the old structure (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437346(v=vs.85)">WSD_SECURITY_CERT_VALIDATION_V1</a>). While it's a given that the application will be supported for Windows 7, it also  on Windows 8 since <b>wsdapi.dll</b> on Windows 8 will handle both the old and the newer versions of this structure.
  * 
  * An application already built using Windows 7 SDK will use the old version of this structure. It will run fine on Windows 8 since <b>wsdapi.dll</b> on Windows 8 can handle both versions.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/ns-wsdbase-wsd_security_cert_validation
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SECURITY_CERT_VALIDATION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structures that contain certificates to be matched against those provided by the HTTPS server or client.  Only one matching certificate is required for validatation.  This parameter can be NULL.
     * @type {Pointer<Pointer<CERT_CONTEXT>>}
     */
    certMatchArray {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The count of certificates in <i>certMatchArray</i>.
     * @type {Integer}
     */
    dwCertMatchArrayCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A handle to a certificate store that contains certificates to be matched against those provided by the HTTPS server or client.  Only one matching certificate is required for validatation.  This parameter can be NULL.
     * @type {HCERTSTORE}
     */
    hCertMatchStore{
        get {
            if(!this.HasProp("__hCertMatchStore"))
                this.__hCertMatchStore := HCERTSTORE(16, this)
            return this.__hCertMatchStore
        }
    }

    /**
     * A handle to a certificate store that contains root certificates against which a certificate from the HTTPS server or client should chain to.  Validation succeeds as long as the certificate chains up to at least one root certificate.  This parameter can be NULL.
     * @type {HCERTSTORE}
     */
    hCertIssuerStore{
        get {
            if(!this.HasProp("__hCertIssuerStore"))
                this.__hCertIssuerStore := HCERTSTORE(24, this)
            return this.__hCertIssuerStore
        }
    }

    /**
     * A bitwise OR combination of values that specify which certificate checks to ignore.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_SSL_CERT_DEFAULT_CHECKS"></a><a id="wsdapi_ssl_cert_default_checks"></a><dl>
     * <dt><b>WSDAPI_SSL_CERT_DEFAULT_CHECKS</b></dt>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Handle any revoked certificate errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_SSL_CERT_IGNORE_REVOCATION"></a><a id="wsdapi_ssl_cert_ignore_revocation"></a><dl>
     * <dt><b>WSDAPI_SSL_CERT_IGNORE_REVOCATION</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore revoked certificate errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_SSL_CERT_IGNORE_EXPIRY"></a><a id="wsdapi_ssl_cert_ignore_expiry"></a><dl>
     * <dt><b>WSDAPI_SSL_CERT_IGNORE_EXPIRY</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore expired certificate errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_SSL_CERT_IGNORE_WRONG_USAGE"></a><a id="wsdapi_ssl_cert_ignore_wrong_usage"></a><dl>
     * <dt><b>WSDAPI_SSL_CERT_IGNORE_WRONG_USAGE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore certificate use errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_SSL_CERT_IGNORE_UNKNOWN_CA"></a><a id="wsdapi_ssl_cert_ignore_unknown_ca"></a><dl>
     * <dt><b>WSDAPI_SSL_CERT_IGNORE_UNKNOWN_CA</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore unknown certificate authority errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSDAPI_SSL_CERT_IGNORE_INVALID_CN"></a><a id="wsdapi_ssl_cert_ignore_invalid_cn"></a><dl>
     * <dt><b>WSDAPI_SSL_CERT_IGNORE_INVALID_CN</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore invalid common name certificate errors.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCertCheckOptions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * 
     * @type {PWSTR}
     */
    pszCNGHashAlgId {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * 
     * @type {Pointer<Integer>}
     */
    pbCertHash {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCertHashSize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
