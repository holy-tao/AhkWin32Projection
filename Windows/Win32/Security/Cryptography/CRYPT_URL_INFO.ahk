#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about groupings of URLs.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_url_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_URL_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Number of seconds between synchronizations.
     */
    dwSyncDeltaTime : UInt32

    /**
     * Number of elements in the rgcGroupEntry array of URL groups.
     */
    cGroup : UInt32

    /**
     * Array of URL groups returned.
     */
    rgcGroupEntry : IntPtr

}
