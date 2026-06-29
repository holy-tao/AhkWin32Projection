#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information needed for SP3 compatible encryption.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_sp3_compatible_aux_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_SP3_COMPATIBLE_AUX_INFO {
    #StructPack 4

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Setting CMSG_SP3_COMPATIBLE_ENCRYPT_FLAG enables SP3 compatible encryption. Zero <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">salt</a> instead of no salt and the encryption algorithm parameters are <b>NULL</b> instead of containing encoded RC2 parameters or encoded IV octet string. The encrypted <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">symmetric key</a> is encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">little-endian</a> instead of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">big-endian</a> form.
     */
    dwFlags : UInt32

}
