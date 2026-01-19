#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the ID of properties for the Delivery Optimization download operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ne-deliveryoptimization-dodownloadproperty
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class DODownloadProperty extends Win32Enum{

    /**
     * Read-only. Use this property to get the ID that uniquely identifies the download. VARIANT type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_Id => 0

    /**
     * Use this property to set or get the remote URI path of the resource to download. This property is required only if *DODownloadProperty_ContentId* isn't provided. VARIANT type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_Uri => 1

    /**
     * Use this property to set or get the download unique content ID. This property is required only if *DODownloadProperty_Uri* isn't provided. VARIANT type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_ContentId => 2

    /**
     * Optional. Use this property to set or get the download display name. VARIANT type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_DisplayName => 3

    /**
     * Use this property to set or get the local path name to save the download file. If the path does not exist, Delivery Optimization will attempt to create it under the caller's privileges. This property is required only if *DODownloadProperty_StreamInterface* wasn’t provided. VARIANT type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_LocalPath => 4

    /**
     * Optional. Use this property to set or get custom HTTP request headers. Delivery Optimization will include these headers during HTTP file request operations. The headers must already be formatted as standard HTTP headers. VARIANT type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_HttpCustomHeaders => 5

    /**
     * Optional. Use this property to set or get one of the **DODownloadCostPolicy** enumeration values. VARIANT type is VT_UI4.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_CostPolicy => 6

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
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_SecurityFlags => 7

    /**
     * Optional. Use this property to set or get callback frequency based on download percentage. VARIANT type is VT_UI4.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_CallbackFreqPercent => 8

    /**
     * Optional. Use this property to set or get callback frequency based on download time. The default is every one second. VARIANT type is VT_UI4.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_CallbackFreqSeconds => 9

    /**
     * Optional. Use this property to set or get the download timeout length for no progress. The minimum accepted value is 60 seconds of no download activity. VARIANT type is VT_UI4.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_NoProgressTimeoutSeconds => 10

    /**
     * Optional. Use this property to set or get the current download priority. VARIANT_TRUE value will bring the download to the foreground with higher priority. The default is background priority. VARIANT type is VT_BOOL.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_ForegroundPriority => 11

    /**
     * Optional. Use this property to set or get the current download blocking mode. VARIANT_TRUE value will cause **IDODownload::Start** to block until download is complete or error has occurred. The default is nonblocking mode. VARIANT type is VT_BOOL.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_BlockingMode => 12

    /**
     * Optional. Use this property to set or get the pointer to **IDODownloadStatusCallback** interface used for download callbacks. VARIANT type is VT_UNKNOWN.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_CallbackInterface => 13

    /**
     * Optional. Use this property to set or get the pointer to IStream interface used for stream download type. VARIANT type is VT_UNKNOWN.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_StreamInterface => 14

    /**
     * Optional write-only. Use this property to set the certificate context to be used during HTTP request operations. The value must consist of serialized bytes of CERT_CONTEXT. VARIANT type is (VT_ARRAY \| VT_UI1).
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_SecurityContext => 15

    /**
     * Optional write-only. Use this property to set the network token to be used during HTTP operations. VARIANT_TRUE value will cause Delivery Optimization to capture the caller's identity token and VARIANT_FALSE will clear the existing token. The default is the token of the logged-on user. VARIANT type is VT_BOOL.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_NetworkToken => 16

    /**
     * Optional. Sets a specific correlation vector for telemetry purposes. VARIANT type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_CorrelationVector => 17

    /**
     * Optional write-only. Sets decryption information in the form of a JSON string. VARIANT type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_DecryptionInfo => 18

    /**
     * Optional write-only. Sets the piece hash file (PHF) location, which is used by Delivery Optimization to perform runtime integrity checks on the downloaded content. VARIANT type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_IntegrityCheckInfo => 19

    /**
     * Optional. Sets a Boolean flag indicating whether usage of the piece hash file (PHF) is mandatory. If VARIANT_TRUE, the download will be aborted if the integrity check fails. VARIANT type is VT_BOOL.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_IntegrityCheckMandatory => 20

    /**
     * Optional. Specifies the total download size in bytes. VARIANT type is VT_UI8.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_TotalSizeBytes => 21

    /**
     * Don't download when on a cellular connection.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_DisallowOnCellular => 22

    /**
     * Custom HTTPS headers are used when challenged.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_HttpCustomAuthHeaders => 23

    /**
     * Https-to-http redirection. Default is `FALSE`.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_HttpAllowSecureToNonSecureRedirect => 24

    /**
     * Save download info to the Windows Registry. Default is `FALSE` for Delivery Optimization download jobs; `TRUE` for BITS-style jobs.
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_NonVolatile => 25

    /**
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_HttpRedirectionTarget => 26

    /**
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_HttpResponseHeaders => 27

    /**
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_HttpServerIPAddress => 28

    /**
     * @type {Integer (Int32)}
     */
    static DODownloadProperty_HttpStatusCode => 29
}
