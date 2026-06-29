#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to provide options for the PKCS
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_pkcs1_padding_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_PKCS1_PADDING_INFO {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic algorithm</a> to use to create the padding. This algorithm must be a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a>. When creating a signature, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that corresponds to this algorithm is added to the <b>DigestInfo</b> element in the signature, and if this member is <b>NULL</b>, then the OID is not added. When verifying a signature, the verification fails if the OID that corresponds to this member is not the same as the OID in the signature. If there is no OID in the signature, then verification fails unless this member is <b>NULL</b>.
     */
    pszAlgId : PWSTR

}
