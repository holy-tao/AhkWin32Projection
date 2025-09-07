#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the kind of data stored in a WSD_CONFIG_PARAM structure.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/ne-wsdbase-wsd_config_param_type
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_CONFIG_PARAM_TYPE{

    /**
     * The <i>pConfigData</i> member is a pointer to a <b>DWORD</b> that specifies the maximum size,  in octets, of an inbound message.
 * 
 * The <i>dwConfigDataSize</i> member is 4.
     * @type {Integer (Int32)}
     */
    static WSD_CONFIG_MAX_INBOUND_MESSAGE_SIZE => 1

    /**
     * The <i>pConfigData</i> member is a pointer to a <b>DWORD</b> that specifies the maximum size, in octets, of an outbound message.
 * 
 * The <i>dwConfigDataSize</i> member is 4.
     * @type {Integer (Int32)}
     */
    static WSD_CONFIG_MAX_OUTBOUND_MESSAGE_SIZE => 2

    /**
     * Used to pass in the client certificate that WSDAPI will use for client authentication in an SSL connection.
 * 
 * The <i>pConfigData</i> member is a pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the client certificate.  The caller needs to have read access to the private key of the certificate.
 * 
 * The <i>dwConfigDataSize</i> member is the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure.
     * @type {Integer (Int32)}
     */
    static WSD_SECURITY_SSL_CERT_FOR_CLIENT_AUTH => 3

    /**
     * Used to pass in the SSL server certificate validation information into WSDAPI.  When establishing the SSL connection, WSDAPI will accept only a server certificate that matches the criteria specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_security_cert_validation">WSD_SECURITY_CERT_VALIDATION</a> structure.
 * 
 * The <i>pConfigData</i> member is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_security_cert_validation">WSD_SECURITY_CERT_VALIDATION</a> structure.
 * 
 * The <i>dwConfigDataSize</i> member is the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_security_cert_validation">WSD_SECURITY_CERT_VALIDATION</a> structure.
     * @type {Integer (Int32)}
     */
    static WSD_SECURITY_SSL_SERVER_CERT_VALIDATION => 4

    /**
     * Used to pass in the SSL client certificate validation information into WSDAPI.  On incoming SSL connections, if a client certificate is available, WSDAPI will reject the connection if the client certificate doesn't match the validation criteria specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_security_cert_validation">WSD_SECURITY_CERT_VALIDATION</a> structure.
 * 
 * The <i>pConfigData</i> member is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_security_cert_validation">WSD_SECURITY_CERT_VALIDATION</a> structure.
 * 
 * The <i>dwConfigDataSize</i> member is the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_security_cert_validation">WSD_SECURITY_CERT_VALIDATION</a> structure.
     * @type {Integer (Int32)}
     */
    static WSD_SECURITY_SSL_CLIENT_CERT_VALIDATION => 5

    /**
     * Specifies that on incoming SSL connections, WSDAPI  will request a client certificate from the SSL client if one is not already made available by the client.  If the remote entity cannot provide a client certificate, the connection will be rejected.  Note that the SSL record that is created for that port must explicitly allow for client certificate negotiation.
 * 
 * The <i>pConfigData</i> member is <b>NULL</b>.
 * 
 * The <i>dwConfigDataSize</i> member is 0.
     * @type {Integer (Int32)}
     */
    static WSD_SECURITY_SSL_NEGOTIATE_CLIENT_CERT => 6

    /**
     * Used to specify which certificate is to be used by WSDAPI to sign outbound WS_Discovery UDP messages.
 * 
 * The <i>pConfigData</i> member is a                                            pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure  that represents the signing certificate.  The caller needs to have read access to the certificate's private key..
 * 
 * The <i>dwConfigDataSize</i> member is the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure.
     * @type {Integer (Int32)}
     */
    static WSD_SECURITY_COMPACTSIG_SIGNING_CERT => 7

    /**
     * This is used to specify the parameters used to verify inbound signed WS_Discovery UDP message.
 * 
 * The <i>pConfigData</i> member is a                                            pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_security_signature_validation">WSD_SECURITY_SIGNATURE_VALIDATION</a> structure.
 * 
 * The <i>dwConfigDataSize</i> member is the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_security_signature_validation">WSD_SECURITY_SIGNATURE_VALIDATION</a> structure.
     * @type {Integer (Int32)}
     */
    static WSD_SECURITY_COMPACTSIG_VALIDATION => 8

    /**
     * This applies only to the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-wsdcreatedevicehost2">WSDCreateDeviceHost2</a> function.  It is used to specify an array of addresses on which the device host should be hosted on.  The equivalent is functionality provided through the <i>ppHostAddresses</i> and <i>dwHostAddressCount</i> parameters of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-wsdcreatedevicehostadvanced">WSDCreateDeviceHostAdvanced</a> function.
 * 
 * The <i>pConfigData</i> member is a                                            pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_addresses">WSD_CONFIG_ADDRESSES</a> structure.  The <b>addresses</b> member of this structure points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> objects, each of which is an address on which the device host will listen on.
 * 
 * The <i>dwConfigDataSize</i> member is the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_addresses">WSD_CONFIG_ADDRESSES</a> structure.
     * @type {Integer (Int32)}
     */
    static WSD_CONFIG_HOSTING_ADDRESSES => 9

    /**
     * This applies only to the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-wsdcreatedeviceproxy2">WSDCreateDeviceProxy2</a> function.  It is used to specify an address for the device for which the proxy is created.  The equivalent is functionality provided through the <i>deviceConfig</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-wsdcreatedeviceproxyadvanced">WSDCreateDeviceProxyAdvanced</a> function.
 * 
 * The <i>pConfigData</i> member is a                                            pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_addresses">WSD_CONFIG_ADDRESSES</a> structure.  The <b>addresses</b> member of this structure points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> objects, each of which is an address of the device to which the proxy is created.  Currently only one such address is allowed.
 * 
 * The <i>dwConfigDataSize</i> member is the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsd_config_addresses">WSD_CONFIG_ADDRESSES</a> structure.
     * @type {Integer (Int32)}
     */
    static WSD_CONFIG_DEVICE_ADDRESSES => 10

    /**
     * Indicates a requirement for HTTP Authentication using one of the auth schemes specified through WSD_SECURITY_HTTP_AUTH_SCHEMES. Specific scenarios include:
 * 
 * <ul>
 * <li>
 * When specified during a <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-wsdcreatedevicehost">WSDCreateDeviceHost</a> operation, DPWS clients will be required to authenticate messages sent to the Hosted Services of the WSDAPI device host using HTTP Authentication.
 * 
 * </li>
 * <li>
 * If this is value is expressed in conjunction with WSD_SECURITY_SSL_NEGOTIATE_CLIENT_CERT, then WSDAPI will require HTTP clients to send a client certificate and utilize HTTP authentication. 
 * 
 * </li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static WSD_SECURITY_REQUIRE_HTTP_CLIENT_AUTH => 11

    /**
     * When this  value is specified, WSDAPI will request HTTP clients to send a client certificate. If the client cannot provide one, then WSDAPI will require  HTTP authentication. If the client can do neither, it will be rejected by WSDAPI. Specific scenarios include:
 * 
 * <ul>
 * <li>
 * When specified during a <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-wsdcreatedevicehost">WSDCreateDeviceHost</a> operation, this behavior will apply to web service messages from DPWS clients.
 * 
 * </li>
 * </ul>
 * <div class="alert"><b>Note</b>  This parameter cannot be used in conjunction with WSD_SECURITY_SSL_NEGOTIATE_CLIENT_CERT. If it is, WSDAPI will return E_INVALIDARG.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WSD_SECURITY_REQUIRE_CLIENT_CERT_OR_HTTP_CLIENT_AUTH => 12

    /**
     * If the server requires authentication, WSDAPI will authenticate using HTTP authentication. Specific scenarios include:
 * 
 * <ul>
 * <li>
 * When specified during a <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-wsdcreatedevicehost">WSDCreateDeviceHost</a> operation, this behavior will apply to web service messages from DPWS clients.
 * 
 * </li>
 * <li>
 * If this value is expressed in conjunction with WSD_SECURITY_SSL_CERT_FOR_CLIENT_AUTH, WSDAPI will send the client certificate and authenticate using HTTP authentication if either operation is required by server.
 * 
 * </li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static WSD_SECURITY_USE_HTTP_CLIENT_AUTH => 13
}
