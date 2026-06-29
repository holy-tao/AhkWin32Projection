#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to provide options for the Probabilistic Signature Scheme (PSS) padding scheme.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_pss_padding_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_PSS_PADDING_INFO {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic algorithm</a> to use to create the padding. This algorithm must be a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a>.
     */
    pszAlgId : PWSTR

    /**
     * The size, in bytes, of the random salt to use for the padding.
     */
    cbSalt : UInt32

}
