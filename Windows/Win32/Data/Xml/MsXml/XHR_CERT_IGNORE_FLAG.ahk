#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags that you can assign to an outgoing HTTP request to ignore certain certificate errors by calling the SetProperty method on the IXMLHTTPRequest3 interface.
 * @see https://docs.microsoft.com/windows/win32/api//msxml6/ne-msxml6-xhr_cert_ignore_flag
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XHR_CERT_IGNORE_FLAG{

    /**
     * Ignore certificate revocation errors.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_IGNORE_REVOCATION_FAILED => 128

    /**
     * Ignore a certificate error for an unknown or invalid certificate authority.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_IGNORE_UNKNOWN_CA => 256

    /**
     * Ignore a certificate error caused by an invalid common name. This allows an invalid common name in a certificate where the server name specified by the app for the requested URL does not match the common name in the server certificate.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_IGNORE_CERT_CN_INVALID => 4096

    /**
     * Ignore a certificate error caused by an invalid date in the certificate. This allows certificates that are expired or not yet effective.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_IGNORE_CERT_DATE_INVALID => 8192

    /**
     * Ignore all server certificate errors.
     * @type {Integer (UInt32)}
     */
    static XHR_CERT_IGNORE_ALL_SERVER_ERRORS => 12672
}
