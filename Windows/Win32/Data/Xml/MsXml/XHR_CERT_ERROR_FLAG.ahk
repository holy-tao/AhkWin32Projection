#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags that indicate server certificate errors during SSL negotiation with the server by handling the OnServerCertificateReceived method on the IXMLHTTPRequest3Callback interface.
 * @see https://docs.microsoft.com/windows/win32/api//msxml6/ne-msxml6-xhr_cert_error_flag
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XHR_CERT_ERROR_FLAG{

    /**
     * The certificate received from the server has an invalid certificate revocation.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_ERROR_REVOCATION_FAILED => 8388608

    /**
     * The certificate received from the server has an unknown or invalid certificate authority.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_ERROR_UNKNOWN_CA => 16777216

    /**
     * The certificate received from the server has an invalid common name.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_ERROR_CERT_CN_INVALID => 33554432

    /**
     * The certificate received from the server has an invalid certificate date.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_ERROR_CERT_DATE_INVALID => 67108864

    /**
     * The certificate received from the server has an invalid certificate revocation, and unknown or invalid certificate authority, an invalid common name, and an invalid certificate date.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_ERROR_ALL_SERVER_ERRORS => 125829120
}
