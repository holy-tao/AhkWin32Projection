#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the ID of properties for the Delivery Optimization download operation.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ne-deliveryoptimization-dodownloadproperty
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
class DODownloadProperty extends Win32Enum {

    /**
     * Read-only. Use this property to get the ID that uniquely identifies the download. VARIANT type is VT_BSTR.
     * Native name: DODownloadProperty_Id
     * @type {Integer (Int32)}
     */
    static Id => 0

    /**
     * Use this property to set or get the remote URI path of the resource to download. This property is required only if *DODownloadProperty_ContentId* isn't provided. VARIANT type is VT_BSTR.
     * Native name: DODownloadProperty_Uri
     * @type {Integer (Int32)}
     */
    static Uri => 1

    /**
     * Use this property to set or get the download unique content ID. This property is required only if *DODownloadProperty_Uri* isn't provided. VARIANT type is VT_BSTR.
     * Native name: DODownloadProperty_ContentId
     * @type {Integer (Int32)}
     */
    static ContentId => 2

    /**
     * Optional. Use this property to set or get the download display name. VARIANT type is VT_BSTR.
     * Native name: DODownloadProperty_DisplayName
     * @type {Integer (Int32)}
     */
    static DisplayName => 3

    /**
     * Use this property to set or get the local path name to save the download file. If the path does not exist, Delivery Optimization will attempt to create it under the caller's privileges. This property is required only if *DODownloadProperty_StreamInterface* wasn’t provided. VARIANT type is VT_BSTR.
     * Native name: DODownloadProperty_LocalPath
     * @type {Integer (Int32)}
     */
    static LocalPath => 4

    /**
     * Optional. Use this property to set or get custom HTTP request headers. Delivery Optimization will include these headers during HTTP file request operations. The headers must already be formatted as standard HTTP headers. VARIANT type is VT_BSTR.
     * Native name: DODownloadProperty_HttpCustomHeaders
     * @type {Integer (Int32)}
     */
    static HttpCustomHeaders => 5

    /**
     * Optional. Use this property to set or get one of the **DODownloadCostPolicy** enumeration values. VARIANT type is VT_UI4.
     * Native name: DODownloadProperty_CostPolicy
     * @type {Integer (Int32)}
     */
    static CostPolicy => 6

    /**
     * Optional write-only. Use this property to set or get the standard WinHTTP security flags (**WINHTTP_OPTION_SECURITY_FLAGS**). VARIANT type is VT_UI4.
     * 
     * The following flags are supported:
     * 
     * * **SECURITY_FLAG_IGNORE_CERT_CN_INVALID**. Allows an invalid common name in a certificate.
     * * **SECURITY_FLAG_IGNORE_CERT_DATE_INVALID**. Allows an invalid certificate date.
     * * **SECURITY_FLAG_IGNORE_UNKNOWN_CA**. Allows an invalid certificate authority.
     * * **SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE**. Allows the identity of a server to be established with a non-server certificate.
     * * **WINHTTP_ENABLE_SSL_REVOCATION**. Allows SSL revocation. If this flag is set, the above flags will be ignored.
     * Native name: DODownloadProperty_SecurityFlags
     * @type {Integer (Int32)}
     */
    static SecurityFlags => 7

    /**
     * Optional. Use this property to set or get callback frequency based on download percentage. VARIANT type is VT_UI4.
     * Native name: DODownloadProperty_CallbackFreqPercent
     * @type {Integer (Int32)}
     */
    static CallbackFreqPercent => 8

    /**
     * Optional. Use this property to set or get callback frequency based on download time. The default is every one second. VARIANT type is VT_UI4.
     * Native name: DODownloadProperty_CallbackFreqSeconds
     * @type {Integer (Int32)}
     */
    static CallbackFreqSeconds => 9

    /**
     * Optional. Use this property to set or get the download timeout length for no progress. The minimum accepted value is 60 seconds of no download activity. VARIANT type is VT_UI4.
     * Native name: DODownloadProperty_NoProgressTimeoutSeconds
     * @type {Integer (Int32)}
     */
    static NoProgressTimeoutSeconds => 10

    /**
     * Optional. Use this property to set or get the current download priority. VARIANT_TRUE value will bring the download to the foreground with higher priority. The default is background priority. VARIANT type is VT_BOOL.
     * Native name: DODownloadProperty_ForegroundPriority
     * @type {Integer (Int32)}
     */
    static ForegroundPriority => 11

    /**
     * Optional. Use this property to set or get the current download blocking mode. VARIANT_TRUE value will cause **IDODownload::Start** to block until download is complete or error has occurred. The default is nonblocking mode. VARIANT type is VT_BOOL.
     * Native name: DODownloadProperty_BlockingMode
     * @type {Integer (Int32)}
     */
    static BlockingMode => 12

    /**
     * Optional. Use this property to set or get the pointer to **IDODownloadStatusCallback** interface used for download callbacks. VARIANT type is VT_UNKNOWN.
     * Native name: DODownloadProperty_CallbackInterface
     * @type {Integer (Int32)}
     */
    static CallbackInterface => 13

    /**
     * Optional. Use this property to set or get the pointer to IStream interface used for stream download type. VARIANT type is VT_UNKNOWN.
     * Native name: DODownloadProperty_StreamInterface
     * @type {Integer (Int32)}
     */
    static StreamInterface => 14

    /**
     * Optional write-only. Use this property to set the certificate context to be used during HTTP request operations. The value must consist of serialized bytes of CERT_CONTEXT. VARIANT type is (VT_ARRAY \| VT_UI1).
     * Native name: DODownloadProperty_SecurityContext
     * @type {Integer (Int32)}
     */
    static SecurityContext => 15

    /**
     * Optional write-only. Use this property to set the network token to be used during HTTP operations. VARIANT_TRUE value will cause Delivery Optimization to capture the caller's identity token and VARIANT_FALSE will clear the existing token. The default is the token of the logged-on user. VARIANT type is VT_BOOL.
     * Native name: DODownloadProperty_NetworkToken
     * @type {Integer (Int32)}
     */
    static NetworkToken => 16

    /**
     * Optional. Sets a specific correlation vector for telemetry purposes. VARIANT type is VT_BSTR.
     * Native name: DODownloadProperty_CorrelationVector
     * @type {Integer (Int32)}
     */
    static CorrelationVector => 17

    /**
     * Optional write-only. Sets decryption information in the form of a JSON string. VARIANT type is VT_BSTR.
     * Native name: DODownloadProperty_DecryptionInfo
     * @type {Integer (Int32)}
     */
    static DecryptionInfo => 18

    /**
     * Optional write-only. Sets the piece hash file (PHF) location, which is used by Delivery Optimization to perform runtime integrity checks on the downloaded content. VARIANT type is VT_BSTR.
     * Native name: DODownloadProperty_IntegrityCheckInfo
     * @type {Integer (Int32)}
     */
    static IntegrityCheckInfo => 19

    /**
     * Optional. Sets a Boolean flag indicating whether usage of the piece hash file (PHF) is mandatory. If VARIANT_TRUE, the download will be aborted if the integrity check fails. VARIANT type is VT_BOOL.
     * Native name: DODownloadProperty_IntegrityCheckMandatory
     * @type {Integer (Int32)}
     */
    static IntegrityCheckMandatory => 20

    /**
     * Optional. Specifies the total download size in bytes. VARIANT type is VT_UI8.
     * Native name: DODownloadProperty_TotalSizeBytes
     * @type {Integer (Int32)}
     */
    static TotalSizeBytes => 21

    /**
     * Don't download when on a cellular connection.
     * Native name: DODownloadProperty_DisallowOnCellular
     * @type {Integer (Int32)}
     */
    static DisallowOnCellular => 22

    /**
     * Custom HTTPS headers are used when challenged.
     * Native name: DODownloadProperty_HttpCustomAuthHeaders
     * @type {Integer (Int32)}
     */
    static HttpCustomAuthHeaders => 23

    /**
     * Https-to-http redirection. Default is `FALSE`.
     * Native name: DODownloadProperty_HttpAllowSecureToNonSecureRedirect
     * @type {Integer (Int32)}
     */
    static HttpAllowSecureToNonSecureRedirect => 24

    /**
     * Save download info to the Windows Registry. Default is `FALSE` for Delivery Optimization download jobs; `TRUE` for BITS-style jobs.
     * Native name: DODownloadProperty_NonVolatile
     * @type {Integer (Int32)}
     */
    static NonVolatile => 25

    /**
     * Native name: DODownloadProperty_HttpRedirectionTarget
     * @type {Integer (Int32)}
     */
    static HttpRedirectionTarget => 26

    /**
     * Native name: DODownloadProperty_HttpResponseHeaders
     * @type {Integer (Int32)}
     */
    static HttpResponseHeaders => 27

    /**
     * Native name: DODownloadProperty_HttpServerIPAddress
     * @type {Integer (Int32)}
     */
    static HttpServerIPAddress => 28

    /**
     * Native name: DODownloadProperty_HttpStatusCode
     * @type {Integer (Int32)}
     */
    static HttpStatusCode => 29
}
