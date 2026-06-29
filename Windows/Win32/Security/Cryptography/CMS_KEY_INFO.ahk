#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ALG_ID.ahk" { ALG_ID }

/**
 * Not used.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cms_key_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMS_KEY_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    dwVersion : UInt32

    /**
     * One of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a> values that identifies the algorithm for the key to be converted.
     */
    Algid : ALG_ID

    /**
     * The address of a buffer that contains additional public information. This member is optional and can be <b>NULL</b> if this is not needed.
     */
    pbOID : IntPtr

    /**
     * The size, in bytes, of the <b>pbOID</b> buffer. This member should be zero if <b>pbOID</b> is not used.
     */
    cbOID : UInt32

}
