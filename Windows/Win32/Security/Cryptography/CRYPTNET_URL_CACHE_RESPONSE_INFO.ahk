#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

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
 * @version v4.0.30319
 */
class CRYPTNET_URL_CACHE_RESPONSE_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    wResponseType {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * A value that specifies a collection of flags that control server-based certificate validation response options.
     * @type {Integer}
     */
    wResponseFlags {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * A <b>FILETIME</b> structure that specifies the <b>Last-Modified</b> entity-header field value  of the cached HTTP response for the URL.
     * @type {FILETIME}
     */
    LastModifiedTime{
        get {
            if(!this.HasProp("__LastModifiedTime"))
                this.__LastModifiedTime := FILETIME(this.ptr + 8)
            return this.__LastModifiedTime
        }
    }

    /**
     * A value that specifies the number of seconds in the <b>max-age</b> directive  of the <b>Cache-Control</b> header of the cached HTTP response for the URL.
     * @type {Integer}
     */
    dwMaxAge {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a string that contains the <b>ETag</b> response-header field value of the cached HTTP response for the URL.
     * @type {Pointer<PWSTR>}
     */
    pwszETag {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A value that contains the MD5 hash of the HTTP response header values <b>Via</b>, <b>ETag</b>, and <b>Last-Modified</b>, if they exist.
     * @type {Integer}
     */
    dwProxyId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
