#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPTNET_URL_CACHE_RESPONSE_INFO.ahk" { CRYPTNET_URL_CACHE_RESPONSE_INFO }
#Import ".\CRYPTNET_URL_CACHE_PRE_FETCH_INFO.ahk" { CRYPTNET_URL_CACHE_PRE_FETCH_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPTNET_URL_CACHE_FLUSH_INFO.ahk" { CRYPTNET_URL_CACHE_FLUSH_INFO }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains optional information to pass to the CryptRetrieveObjectByUrl function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_retrieve_aux_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_RETRIEVE_AUX_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time of the last synchronization of the data retrieved.
     */
    pLastSyncTime : FILETIME.Ptr

    /**
     * A value that specifies a limit to the number of bytes retrieved. A value of zero or less specifies no limit.
     */
    dwMaxUrlRetrievalByteCount : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cryptnet_url_cache_pre_fetch_info">CRYPTNET_URL_CACHE_PRE_FETCH_INFO</a> structure. To get prefetch information, set its <b>cbSize</b> upon input. For no prefetch information, except for <b>cbSize</b>, the data structure contains zero upon return.
     */
    pPreFetchInfo : CRYPTNET_URL_CACHE_PRE_FETCH_INFO.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cryptnet_url_cache_flush_info">CRYPTNET_URL_CACHE_FLUSH_INFO</a> structure. To get flush information, set its <b>cbSize</b> upon input. For no flush information, except for <b>cbSize</b>, the data structure
     *     contains zero upon return.
     */
    pFlushInfo : CRYPTNET_URL_CACHE_FLUSH_INFO.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cryptnet_url_cache_response_info">PCRYPTNET_URL_CACHE_RESPONSE_INFO</a> structure. To get response information, set the pointer to the address of a <b>CRYPTNET_URL_CACHE_RESPONSE_INFO</b> pointer updated with the allocated structure. For no response information, <b>ppResponseInfo</b> is set to <b>NULL</b>. If it is not <b>NULL</b>, it must be freed by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmemfree">CryptMemFree</a> function.
     */
    ppResponseInfo : IntPtr

    /**
     * A pointer to a string that contains a prefix for a cached file name. If not <b>NULL</b>, the specified prefix string is concatenated to the front of the cached file name.
     */
    pwszCacheFileNamePrefix : PWSTR

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies a cache synchronization time. If not <b>NULL</b>, any information cached before this time is considered time invalid. For a <b>CRYPT_CACHE_ONLY_RETRIEVAL</b>, if there is a cached entry before this time, <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptretrieveobjectbyurla">CryptRetrieveObjectByUrl</a> returns <b>ERROR_INVALID_TIME</b>. When used with an HTTP retrieval, this specifies the maximum age for a time-valid object.
     */
    pftCacheResync : FILETIME.Ptr

    /**
     * A value that indicates whether <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptretrieveobjectbyurla">CryptRetrieveObjectByUrl</a> was called with <b>CRYPT_PROXY_CACHE_RETRIEVAL</b> set in <i>dwRetrievalFlags</i> and a proxy cache was not explicitly bypassed for the retrieval. This flag is not explicitly cleared and only applies to HTTP URL retrievals.
     */
    fProxyCacheRetrieval : BOOL

    /**
     * A value that specifies a status code from an unsuccessful HTTP response header. If <b>CRYPT_NOT_MODIFIED_RETRIEVAL</b> was set in <i>dwRetrievalFlags</i>, and the HTTP retrieval returns <b>HTTP_STATUS_NOT_MODIFIED</b>, this contains the <b>HTTP_STATUS_NOT_MODIFIED</b> status code. This value is not explicitly cleared and is only updated for HTTP or HTTPS URL retrievals.
     */
    dwHttpStatusCode : UInt32

    ppwszErrorResponseHeaders : PWSTR.Ptr

    ppErrorContentBlob : IntPtr

}
