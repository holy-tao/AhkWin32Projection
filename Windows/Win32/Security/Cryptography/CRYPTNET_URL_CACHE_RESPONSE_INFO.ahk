#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains response information used by the Cryptnet URL Cache (CUC) service to maintain a URL cache entry.
 * @remarks
 * If not specified in the HTTP response headers, the cache service sets the values of the <b>LastModifiedTime</b>, <b>dwMaxAge</b>, <b>pwszETag</b>, and <b>dwProxyId</b> members to zero.
 * 
 * The cache service only allows a strong <b>ETag</b> in the <b>pwszETag</b> member.
 * 
 * To determine whether a response is valid, the cache service performs a bitwise <b>AND</b> of the <b>wResponseFlags</b> member with the following constant defined in Wincrypt.h. If the result is <b>TRUE</b>, the response is valid.
 * 
 * <table>
 * <tr>
 * <th>Name</th>
 * <th>Value</th>
 * </tr>
 * <tr>
 * <td>CRYPTNET_URL_CACHE_RESPONSE_VALIDATED</td>
 * <td>0x8000</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cryptnet_url_cache_response_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPTNET_URL_CACHE_RESPONSE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A value that indicates whether the cache entry contains HTTP response information.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTNET_URL_CACHE_RESPONSE_NONE"></a><a id="cryptnet_url_cache_response_none"></a><dl>
     * <dt><b>CRYPTNET_URL_CACHE_RESPONSE_NONE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache entry contains no response information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTNET_URL_CACHE_RESPONSE_HTTP"></a><a id="cryptnet_url_cache_response_http"></a><dl>
     * <dt><b>CRYPTNET_URL_CACHE_RESPONSE_HTTP</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache entry contains response information derived from HTTP response headers.
     * 
     * </td>
     * </tr>
     * </table>
     */
    wResponseType : UInt16

    /**
     * A value that specifies a collection of flags that control server-based certificate validation response options.
     */
    wResponseFlags : UInt16

    /**
     * A <b>FILETIME</b> structure that specifies the <b>Last-Modified</b> entity-header field value  of the cached HTTP response for the URL.
     */
    LastModifiedTime : FILETIME

    /**
     * A value that specifies the number of seconds in the <b>max-age</b> directive  of the <b>Cache-Control</b> header of the cached HTTP response for the URL.
     */
    dwMaxAge : UInt32

    /**
     * A pointer to a string that contains the <b>ETag</b> response-header field value of the cached HTTP response for the URL.
     */
    pwszETag : PWSTR

    /**
     * A value that contains the MD5 hash of the HTTP response header values <b>Via</b>, <b>ETag</b>, and <b>Last-Modified</b>, if they exist.
     */
    dwProxyId : UInt32

}
