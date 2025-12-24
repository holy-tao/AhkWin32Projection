#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to specify client certificates for certificate-based client authentication and custom headers for HTTP requests.
 * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nn-bits2_5-ibackgroundcopyjobhttpoptions
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJobHttpOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJobHttpOptions
     * @type {Guid}
     */
    static IID => Guid("{f1bd1079-9f01-4bdc-8036-f09b70095066}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetClientCertificateByID", "SetClientCertificateByName", "RemoveClientCertificate", "GetClientCertificate", "SetCustomHeaders", "GetCustomHeaders", "SetSecurityFlags", "GetSecurityFlags"]

    /**
     * Specifies the identifier of the client certificate to use for client authentication in an HTTPS (SSL) request.
     * @param {Integer} StoreLocation Identifies the location of a system store to use for looking up the certificate. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/bits2_5/ne-bits2_5-bg_cert_store_location">BG_CERT_STORE_LOCATION</a> enumeration.
     * @param {PWSTR} StoreName Null-terminated string that contains the name of the certificate store. The string is limited to 256 characters, including the null terminator. You can specify one of the following system stores or an application-defined store. The store can be a local or remote store.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CA"></a><a id="ca"></a><dl>
     * <dt><b>CA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certification authority certificates
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MY"></a><a id="my"></a><dl>
     * <dt><b>MY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Personal certificates
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ROOT"></a><a id="root"></a><dl>
     * <dt><b>ROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Root certificates
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPC"></a><a id="spc"></a><dl>
     * <dt><b>SPC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Software Publisher Certificate
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pCertHashBlob SHA1 hash that identifies the certificate. Use a 20 byte buffer for the hash. For more information, see Remarks.
     * @returns {HRESULT} The following table lists some of the possible return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have permission to access the store location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for the <i>StoreLocation</i> parameter is not defined in the <a href="/windows/win32/api/bits2_5/ne-bits2_5-bg_cert_store_location">BG_CERT_STORE_LOCATION</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find a store matching the <i>StoreName</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate matching the hash was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_NULL_REF_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>StoreName</i> or <i>pCertHashBlob</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_BAD_STUB_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCertHashBlob</i> buffer size is not 20 bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_STRING_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>StoreName</i> parameter is more than 256 characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setclientcertificatebyid
     */
    SetClientCertificateByID(StoreLocation, StoreName, pCertHashBlob) {
        StoreName := StoreName is String ? StrPtr(StoreName) : StoreName

        pCertHashBlobMarshal := pCertHashBlob is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", StoreLocation, "ptr", StoreName, pCertHashBlobMarshal, pCertHashBlob, "HRESULT")
        return result
    }

    /**
     * Specifies the subject name of the client certificate to use for client authentication in an HTTPS (SSL) request.
     * @param {Integer} StoreLocation Identifies the location of a system store to use for looking up the certificate. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/bits2_5/ne-bits2_5-bg_cert_store_location">BG_CERT_STORE_LOCATION</a> enumeration.
     * @param {PWSTR} StoreName Null-terminated string that contains the name of the certificate store. The string is limited to 256 characters, including the null terminator. You can specify one of the following system stores or an application-defined store. The store can be a local or remote store. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CA"></a><a id="ca"></a><dl>
     * <dt><b>CA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certification authority certificates
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MY"></a><a id="my"></a><dl>
     * <dt><b>MY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Personal certificates
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ROOT"></a><a id="root"></a><dl>
     * <dt><b>ROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Root certificates
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPC"></a><a id="spc"></a><dl>
     * <dt><b>SPC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Software Publisher Certificate
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} SubjectName Null-terminated string that contains the simple subject name of the certificate. If the subject name contains multiple relative distinguished names (RDNs), you can specify one or more adjacent RDNs. If you specify more than one RDN, the list is comma-delimited. The string is limited to 256 characters, including the null terminator. You cannot specify an empty subject name. 
     * 
     * Do not include the object identifier in the name. You must specify the RDNs in the reverse order from what the certificate displays. For example, if the subject name in the certificate is "CN=name1, OU=name2, O=name3", specify the subject name as "name3, name2, name1".
     * @returns {HRESULT} The following table lists some of the possible return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have permission to access the store location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for <i>StoreLocation</i> is not defined in the <a href="/windows/win32/api/bits2_5/ne-bits2_5-bg_cert_store_location">BG_CERT_STORE_LOCATION</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find a store matching the value of the <i>StoreName</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate matching the subject name was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_X_NULL_REF_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>StoreName</i> or <i>SubjectName</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_STRING_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>StoreName</i> or <i>SubjectName</i> parameter is more than 256 characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setclientcertificatebyname
     */
    SetClientCertificateByName(StoreLocation, StoreName, SubjectName) {
        StoreName := StoreName is String ? StrPtr(StoreName) : StoreName
        SubjectName := SubjectName is String ? StrPtr(SubjectName) : SubjectName

        result := ComCall(4, this, "int", StoreLocation, "ptr", StoreName, "ptr", SubjectName, "HRESULT")
        return result
    }

    /**
     * Removes the client certificate from the job.
     * @returns {HRESULT} The following table lists some of the possible return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully removed the certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job does not specify a certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-removeclientcertificate
     */
    RemoveClientCertificate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the client certificate from the job.
     * @param {Pointer<Integer>} pStoreLocation Identifies the location of a system store to use for looking up the certificate. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/bits2_5/ne-bits2_5-bg_cert_store_location">BG_CERT_STORE_LOCATION</a> enumeration.
     * @param {Pointer<PWSTR>} pStoreName Null-terminated string that contains the name of the certificate store. To free the string when done, call  the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Pointer<Integer>>} ppCertHashBlob SHA1 hash that identifies the certificate. To free the blob when done, call  the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<PWSTR>} pSubjectName Null-terminated string that contains the simple subject name of the certificate. The RDNs in the subject name are in the reverse order from what the certificate displays. Subject name can be empty if the certificate does not contain a subject name. To free the string when done, call  the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} The following table lists some of the possible return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully retrieved the certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>RPC_X_BAD_STUB_DATA</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job does not specify a certificate or the user does not have permissions to the certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>RPC_X_NULL_REF_POINTER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-getclientcertificate
     */
    GetClientCertificate(pStoreLocation, pStoreName, ppCertHashBlob, pSubjectName) {
        pStoreLocationMarshal := pStoreLocation is VarRef ? "int*" : "ptr"
        pStoreNameMarshal := pStoreName is VarRef ? "ptr*" : "ptr"
        ppCertHashBlobMarshal := ppCertHashBlob is VarRef ? "ptr*" : "ptr"
        pSubjectNameMarshal := pSubjectName is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pStoreLocationMarshal, pStoreLocation, pStoreNameMarshal, pStoreName, ppCertHashBlobMarshal, ppCertHashBlob, pSubjectNameMarshal, pSubjectName, "HRESULT")
        return result
    }

    /**
     * Specifies one or more custom HTTP headers to include in HTTP requests.
     * @param {PWSTR} RequestHeaders Null-terminated string that contains the custom headers to append to the HTTP request. Each header must be terminated by a carriage return and line feed (CR/LF) character. The string is limited to 16,384 characters, including the null terminator.
     * 
     * To remove the custom headers from the job, set the <i>RequestHeaders</i> parameter to <b>NULL</b>.
     * @returns {HRESULT} The following table lists some of the possible return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_STRING_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length of the custom headers is more than 16 KB.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setcustomheaders
     */
    SetCustomHeaders(RequestHeaders) {
        RequestHeaders := RequestHeaders is String ? StrPtr(RequestHeaders) : RequestHeaders

        result := ComCall(7, this, "ptr", RequestHeaders, "HRESULT")
        return result
    }

    /**
     * Retrieves the custom headers set by an earlier call to IBackgroundCopyJobHttpOptions::SetCustomHeaders (that is, headers which BITS will be sending to the remote, not headers which BITS receives from the remote).
     * @returns {PWSTR} Null-terminated string that contains the custom headers. Each header is terminated by a carriage return and line feed (CR/LF) character. To free the string when finished, call  the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-getcustomheaders
     */
    GetCustomHeaders() {
        result := ComCall(8, this, "ptr*", &pRequestHeaders := 0, "HRESULT")
        return pRequestHeaders
    }

    /**
     * Sets flags for HTTP that determine whether the certificate revocation list is checked and certain certificate errors are ignored, and the policy to use when a server redirects the HTTP request.
     * @param {Integer} Flags HTTP security flags that indicate which errors to ignore when connecting to the server. You can set one or more of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_ENABLE_CRL_CHECK"></a><a id="bg_ssl_enable_crl_check"></a><dl>
     * <dt><b>BG_SSL_ENABLE_CRL_CHECK</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check the certificate revocation list (CRL) to verify that the server certificate has not been revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_IGNORE_CERT_CN_INVALID"></a><a id="bg_ssl_ignore_cert_cn_invalid"></a><dl>
     * <dt><b>BG_SSL_IGNORE_CERT_CN_INVALID</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignores errors caused when the certificate host name of the server does not match the host name in the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_IGNORE_CERT_DATE_INVALID"></a><a id="bg_ssl_ignore_cert_date_invalid"></a><dl>
     * <dt><b>BG_SSL_IGNORE_CERT_DATE_INVALID</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignores errors caused by an expired certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_IGNORE_UNKNOWN_CA"></a><a id="bg_ssl_ignore_unknown_ca"></a><dl>
     * <dt><b>BG_SSL_IGNORE_UNKNOWN_CA</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore errors associated with an unknown  certification authority (CA).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_IGNORE_CERT_WRONG_USAGE"></a><a id="bg_ssl_ignore_cert_wrong_usage"></a><dl>
     * <dt><b>BG_SSL_IGNORE_CERT_WRONG_USAGE</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore errors associated with the use of a certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_ALLOW_SILENT"></a><a id="bg_http_redirect_policy_allow_silent"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_ALLOW_SILENT</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the server to redirect your request to another server. This is the default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT"></a><a id="bg_http_redirect_policy_allow_report"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the server to redirect your request to another server. BITS updates the remote name with the final URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_DISALLOW"></a><a id="bg_http_redirect_policy_disallow"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_DISALLOW</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Places the job in the fatal error state when the server redirects your request to another server. BITS updates the remote name with the redirected URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_MASK"></a><a id="bg_http_redirect_policy_mask"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_MASK</b></dt>
     * <dt>0x0700</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bitmask that you can use with the security flag value to determine which redirect policy is in effect. It does not include the flag ALLOW_HTTPS_TO_HTTP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_ALLOW_HTTPS_TO_HTTP"></a><a id="bg_http_redirect_policy_allow_https_to_http"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_ALLOW_HTTPS_TO_HTTP</b></dt>
     * <dt>0x0800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the server to redirect an HTTPS request to an HTTP URL.
     * 
     * You can combine this flag with BG_HTTP_REDIRECT_POLICY_ALLOW_SILENT and BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The following table lists some of the possible return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully retrieved the headers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_NOTIMPL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setsecurityflags
     */
    SetSecurityFlags(Flags) {
        result := ComCall(9, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Retrieves the flags for HTTP that determine whether the certificate revocation list is checked and certain certificate errors are ignored, and the policy to use when a server redirects the HTTP request.
     * @returns {Integer} HTTP security flags that indicate which errors to ignore when connecting to the server. One or more of the following flags can be set:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_ENABLE_CRL_CHECK"></a><a id="bg_ssl_enable_crl_check"></a><dl>
     * <dt><b>BG_SSL_ENABLE_CRL_CHECK</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check the certificate revocation list (CRL) to verify that the server certificate has not been revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_IGNORE_CERT_CN_INVALID"></a><a id="bg_ssl_ignore_cert_cn_invalid"></a><dl>
     * <dt><b>BG_SSL_IGNORE_CERT_CN_INVALID</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignores errors caused when the certificate host name of the server does not match the host name in the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_IGNORE_CERT_DATE_INVALID"></a><a id="bg_ssl_ignore_cert_date_invalid"></a><dl>
     * <dt><b>BG_SSL_IGNORE_CERT_DATE_INVALID</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignores errors caused by an expired certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_IGNORE_UNKNOWN_CA"></a><a id="bg_ssl_ignore_unknown_ca"></a><dl>
     * <dt><b>BG_SSL_IGNORE_UNKNOWN_CA</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore errors associated with an unknown  certification authority (CA).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_SSL_IGNORE_CERT_WRONG_USAGE"></a><a id="bg_ssl_ignore_cert_wrong_usage"></a><dl>
     * <dt><b>BG_SSL_IGNORE_CERT_WRONG_USAGE</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore errors associated with the use of a certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_ALLOW_SILENT"></a><a id="bg_http_redirect_policy_allow_silent"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_ALLOW_SILENT</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the server to redirect your request to another server. This is the default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT"></a><a id="bg_http_redirect_policy_allow_report"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the server to redirect your request to another server. BITS updates the remote name with the final URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_DISALLOW"></a><a id="bg_http_redirect_policy_disallow"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_DISALLOW</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Places the job in the fatal error state when the server redirects your request to another server. BITS updates the remote name with the redirected URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_MASK"></a><a id="bg_http_redirect_policy_mask"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_MASK</b></dt>
     * <dt>0x0700</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bitmask that you can use with the security flag value to determine which redirect policy is in effect. It does not include the flag ALLOW_HTTPS_TO_HTTP.
     * 
     * The following example shows how to use this mask to test for the BG_HTTP_REDIRECT_POLICY_DISALLOW redirection policy.
     * 
     * <c>if (BG_HTTP_REDIRECT_POLICY_DISALLOW == (flags &amp; BG_HTTP_REDIRECT_POLICY_MASK))</c>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_HTTP_REDIRECT_POLICY_ALLOW_HTTPS_TO_HTTP"></a><a id="bg_http_redirect_policy_allow_https_to_http"></a><dl>
     * <dt><b>BG_HTTP_REDIRECT_POLICY_ALLOW_HTTPS_TO_HTTP</b></dt>
     * <dt>0x0800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the server to redirect an HTTPS request to an HTTP URL.
     * 
     * You can combine this flag with BG_HTTP_REDIRECT_POLICY_ALLOW_SILENT and BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-getsecurityflags
     */
    GetSecurityFlags() {
        result := ComCall(10, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }
}
