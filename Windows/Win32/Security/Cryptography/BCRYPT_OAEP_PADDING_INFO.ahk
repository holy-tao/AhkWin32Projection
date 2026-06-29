#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to provide options for the Optimal Asymmetric Encryption Padding (OAEP) scheme.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_oaep_padding_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_OAEP_PADDING_INFO {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic algorithm</a> to use to create the padding. This algorithm must be a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a>.
     */
    pszAlgId : PWSTR

    /**
     * The address of a buffer that contains the data to use to create the padding. The <b>cbLabel</b> member contains the size of this buffer.
     */
    pbLabel : IntPtr

    /**
     * Contains the number of bytes in the <b>pbLabel</b> buffer to use to create the padding.
     */
    cbLabel : UInt32

}
