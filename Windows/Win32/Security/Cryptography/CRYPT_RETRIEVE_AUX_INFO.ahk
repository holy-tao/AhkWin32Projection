#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains optional information to pass to the CryptRetrieveObjectByUrl function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_retrieve_aux_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_RETRIEVE_AUX_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time of the last synchronization of the data retrieved.
     * @type {Pointer<FILETIME>}
     */
    pLastSyncTime {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A value that specifies a limit to the number of bytes retrieved. A value of zero or less specifies no limit.
     * @type {Integer}
     */
    dwMaxUrlRetrievalByteCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cryptnet_url_cache_pre_fetch_info">CRYPTNET_URL_CACHE_PRE_FETCH_INFO</a> structure. To get prefetch information, set its <b>cbSize</b> upon input. For no prefetch information, except for <b>cbSize</b>, the data structure contains zero upon return.
     * @type {Pointer<CRYPTNET_URL_CACHE_PRE_FETCH_INFO>}
     */
    pPreFetchInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cryptnet_url_cache_flush_info">CRYPTNET_URL_CACHE_FLUSH_INFO</a> structure. To get flush information, set its <b>cbSize</b> upon input. For no flush information, except for <b>cbSize</b>, the data structure
     *     contains zero upon return.
     * @type {Pointer<CRYPTNET_URL_CACHE_FLUSH_INFO>}
     */
    pFlushInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cryptnet_url_cache_response_info">PCRYPTNET_URL_CACHE_RESPONSE_INFO</a> structure. To get response information, set the pointer to the address of a <b>CRYPTNET_URL_CACHE_RESPONSE_INFO</b> pointer updated with the allocated structure. For no response information, <b>ppResponseInfo</b> is set to <b>NULL</b>. If it is not <b>NULL</b>, it must be freed by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmemfree">CryptMemFree</a> function.
     * @type {Pointer<CRYPTNET_URL_CACHE_RESPONSE_INFO>}
     */
    ppResponseInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a string that contains a prefix for a cached file name. If not <b>NULL</b>, the specified prefix string is concatenated to the front of the cached file name.
     * @type {Pointer<PWSTR>}
     */
    pwszCacheFileNamePrefix {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies a cache synchronization time. If not <b>NULL</b>, any information cached before this time is considered time invalid. For a <b>CRYPT_CACHE_ONLY_RETRIEVAL</b>, if there is a cached entry before this time, <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptretrieveobjectbyurla">CryptRetrieveObjectByUrl</a> returns <b>ERROR_INVALID_TIME</b>. When used with an HTTP retrieval, this specifies the maximum age for a time-valid object.
     * @type {Pointer<FILETIME>}
     */
    pftCacheResync {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A value that indicates whether <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptretrieveobjectbyurla">CryptRetrieveObjectByUrl</a> was called with <b>CRYPT_PROXY_CACHE_RETRIEVAL</b> set in <i>dwRetrievalFlags</i> and a proxy cache was not explicitly bypassed for the retrieval. This flag is not explicitly cleared and only applies to HTTP URL retrievals.
     * @type {Integer}
     */
    fProxyCacheRetrieval {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * A value that specifies a status code from an unsuccessful HTTP response header. If <b>CRYPT_NOT_MODIFIED_RETRIEVAL</b> was set in <i>dwRetrievalFlags</i>, and the HTTP retrieval returns <b>HTTP_STATUS_NOT_MODIFIED</b>, this contains the <b>HTTP_STATUS_NOT_MODIFIED</b> status code. This value is not explicitly cleared and is only updated for HTTP or HTTPS URL retrievals.
     * @type {Integer}
     */
    dwHttpStatusCode {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * 
     * @type {Pointer<PWSTR>}
     */
    ppwszErrorResponseHeaders {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * 
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    ppErrorContentBlob {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 88
    }
}
