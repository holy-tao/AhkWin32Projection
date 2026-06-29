#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\CRYPTCAT_OPEN_FLAGS.ahk" { CRYPTCAT_OPEN_FLAGS }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents a catalog file.
 * @see https://learn.microsoft.com/windows/win32/api/mscat/ns-mscat-cryptcatstore
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
export default struct CRYPTCATSTORE {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A value that specifies the "PublicVersion" of the catalog file.
     */
    dwPublicVersion : UInt32

    /**
     * A pointer to a null-terminated string that contains the name of the catalog file. This member must be initialized before a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatpersiststore">CryptCATPersistStore</a> function.
     */
    pwszP7File : PWSTR

    /**
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP).
     */
    hProv : IntPtr

    /**
     * A value that specifies the encoding type used for the file. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. For either current encoding type, use: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING.
     */
    dwEncodingType : UInt32

    fdwStoreFlags : CRYPTCAT_OPEN_FLAGS

    /**
     * This member is reserved and must be <b>NULL</b>.
     */
    hReserved : HANDLE

    /**
     * This member is reserved and must be <b>NULL</b>.
     */
    hAttrs : HANDLE

    /**
     * A handle to the decoded bytes. This member is only set if the file was opened with the <b>CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG</b> flag set.
     */
    hCryptMsg : IntPtr

    /**
     * This member is reserved and must be <b>NULL</b>.
     */
    hSorted : HANDLE

}
