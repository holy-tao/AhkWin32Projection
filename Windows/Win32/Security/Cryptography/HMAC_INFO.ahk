#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ALG_ID.ahk" { ALG_ID }

/**
 * The HMAC_INFO structure specifies the hash algorithm and the inner and outer strings that are to be used to calculate the HMAC hash.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-hmac_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct HMAC_INFO {
    #StructPack 8

    /**
     * Specifies the hash algorithm to be used.
     */
    HashAlgid : ALG_ID

    /**
     * A pointer to the inner string to be used in the HMAC calculation. The default inner string is defined as the byte 0x36 repeated 64 times.
     */
    pbInnerString : IntPtr

    /**
     * The count of bytes in <b>pbInnerString</b>. The CSP uses the default inner string if <b>cbInnerString</b> is equal to zero.
     */
    cbInnerString : UInt32

    /**
     * A pointer to the outer string to be used in the HMAC calculation. The default outer string is defined as the byte 0x5C repeated 64 times.
     */
    pbOuterString : IntPtr

    /**
     * The count of bytes in <b>pbOuterString</b>. The CSP uses the default outer string if <b>cbOuterString</b> is equal to zero.
     */
    cbOuterString : UInt32

}
