#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines a record in the SSL configuration store.
 * @remarks
 * Together with a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_key">HTTP_SERVICE_CONFIG_SSL_KEY</a> structure, the <b>HTTP_SERVICE_CONFIG_SSL_PARAM</b> structure makes up the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_set">HTTP_SERVICE_CONFIG_SSL_SET</a> structure passed to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a> function in the <i>pConfigInformation</i> parameter when the <i>ConfigId</i> parameter is set to <b>HttpServiceConfigSSLCertInfo</b>.
 * 
 * Together with a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_key">HTTP_SERVICE_CONFIG_SSL_CCS_KEY</a> structure, the <b>HTTP_SERVICE_CONFIG_SSL_PARAM</b> structure makes up the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_set">HTTP_SERVICE_CONFIG_SSL_CCS_SET</a> structure passed to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a> function in the <i>pConfigInformation</i> parameter when the <i>ConfigId</i> parameter is set to <b>HttpServiceConfigSslCcsCertInfo</b>.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_param
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_PARAM {
    #StructPack 8

    /**
     * The size, in bytes,  of the SSL hash.
     */
    SslHashLength : UInt32

    /**
     * A pointer to the SSL certificate hash.
     */
    pSslHash : IntPtr

    /**
     * A unique identifier of the application setting this record.
     */
    AppId : Guid

    /**
     * A pointer to a wide-character string that contains the name of the store from which the server certificate is to be read. If set to <b>NULL</b>, "MY" is assumed as the default name. The specified certificate store name must be present in the Local System store location.
     */
    pSslCertStoreName : PWSTR

    DefaultCertCheckMode : UInt32

    /**
     * The number of seconds after which to check for an updated certificate revocation list (CRL). If this value is zero, the new CRL is updated only when the previous one expires.
     */
    DefaultRevocationFreshnessTime : UInt32

    /**
     * The timeout interval, in milliseconds,  for an attempt to retrieve a certificate revocation list from the remote URL.
     */
    DefaultRevocationUrlRetrievalTimeout : UInt32

    /**
     * A pointer to an SSL control identifier, which enables an application to restrict the group of certificate issuers to be trusted. This group must be a subset of the certificate issuers trusted by the machine on which the application is running.
     */
    pDefaultSslCtlIdentifier : PWSTR

    /**
     * The name of the store where the control identifier pointed to by <b>pDefaultSslCtlIdentifier</b> is stored.
     */
    pDefaultSslCtlStoreName : PWSTR

    /**
     * A combination of zero or more of the following flag values can be combined with OR as appropriate.
     * 
     * <table>
     * <tr>
     * <th>Flags</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SERVICE_CONFIG_SSL_FLAG_NEGOTIATE_CLIENT_CERT"></a><a id="http_service_config_ssl_flag_negotiate_client_cert"></a><dl>
     * <dt><b>HTTP_SERVICE_CONFIG_SSL_FLAG_NEGOTIATE_CLIENT_CERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables a client certificate to be cached locally for subsequent use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SERVICE_CONFIG_SSL_FLAG_NO_RAW_FILTER"></a><a id="http_service_config_ssl_flag_no_raw_filter"></a><dl>
     * <dt><b>HTTP_SERVICE_CONFIG_SSL_FLAG_NO_RAW_FILTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prevents SSL requests from being passed to low-level ISAPI filters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SERVICE_CONFIG_SSL_FLAG_USE_DS_MAPPER"></a><a id="http_service_config_ssl_flag_use_ds_mapper"></a><dl>
     * <dt><b>HTTP_SERVICE_CONFIG_SSL_FLAG_USE_DS_MAPPER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Client certificates are mapped where possible to corresponding operating-system user accounts based on the certificate mapping rules stored in Active Directory. 
     * 
     * 
     * 
     * 
     * If this flag is set and the mapping is successful, the <b>Token</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_ssl_client_cert_info">HTTP_SSL_CLIENT_CERT_INFO</a> structure is a handle to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-tokens">access token</a>. Release this token explicitly by closing the handle when the 
     * <b>HTTP_SSL_CLIENT_CERT_INFO</b> structure is no longer required.
     * 
     * </td>
     * </tr>
     * </table>
     */
    DefaultFlags : UInt32

}
