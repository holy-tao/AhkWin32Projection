#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains expiry information used by the Cryptnet URL Cache (CUC) service to maintain a URL cache entry.
 * @remarks
 * The <b>dwExemptSeconds</b> member is added to the <b>ExpireTime</b> member to determine the flush time. If the <b>pLastSyncTime</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_retrieve_aux_info">CRYPT_RETRIEVE_AUX_INFO</a> structure  is after the <b>ExpireTime</b> member, the <b>pLastSyncTime</b> member  determines the flush time.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cryptnet_url_cache_flush_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPTNET_URL_CACHE_FLUSH_INFO extends Win32Struct
{
    static sizeof => 16

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
     * A value that specifies how long to extend the <b>ExpireTime</b> member. If prefetch is enabled, the CUC service ignores this value.
     * 
     * 
     * The following values have special meaning.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTNET_URL_CACHE_DEFAULT_FLUSH"></a><a id="cryptnet_url_cache_default_flush"></a><dl>
     * <dt><b>CRYPTNET_URL_CACHE_DEFAULT_FLUSH</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the default flush exempt seconds for a retrieved URL. The following <b>REG_DWORD</b> constants define the default value of dwExemptSeconds for a computer.
     * 
     * <dl>
     * <dt>CRYPTNET_URL_CACHE_DEFAULT_FLUSH_EXEMPT_SECONDS_VALUE_NAME L"CryptnetDefaultFlushExemptSeconds"</dt>
     * <dt>CRYPTNET_URL_CACHE_DEFAULT_FLUSH_EXEMPT_SECONDS_DEFAULT (28 * 24 * 60 * 60)</dt>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTNET_URL_CACHE_DISABLE_FLUSH"></a><a id="cryptnet_url_cache_disable_flush"></a><dl>
     * <dt><b>CRYPTNET_URL_CACHE_DISABLE_FLUSH</b></dt>
     * <dt>0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable cache flushing for a retrieved URL.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwExemptSeconds {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time the object expires.
     * @type {FILETIME}
     */
    ExpireTime{
        get {
            if(!this.HasProp("__ExpireTime"))
                this.__ExpireTime := FILETIME(this.ptr + 8)
            return this.__ExpireTime
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 16
    }
}
