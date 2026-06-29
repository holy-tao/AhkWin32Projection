#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a key container parameter.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_key_prov_param
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_KEY_PROV_PARAM {
    #StructPack 8

    /**
     * Identifies the parameter. For possible values, see the <i>dwParam</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptsetprovparam">CryptSetProvParam</a> function.
     */
    dwParam : UInt32

    /**
     * The address of a buffer that contains the parameter data. For more information, see the <i>pbData</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptsetprovparam">CryptSetProvParam</a> function.
     */
    pbData : IntPtr

    /**
     * The size, in bytes, of the <b>pbData</b> buffer.
     */
    cbData : UInt32

    /**
     * This member is reserved for future use and is zero.
     */
    dwFlags : UInt32

}
