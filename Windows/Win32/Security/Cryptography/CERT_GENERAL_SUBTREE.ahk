#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ALT_NAME_ENTRY.ahk" { CERT_ALT_NAME_ENTRY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_OTHER_NAME.ahk" { CERT_OTHER_NAME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CERT_GENERAL_SUBTREE structure is used in CERT_NAME_CONSTRAINTS_INFO structure. This structure provides the identity of a certificate that can be included or excluded.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_general_subtree
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_GENERAL_SUBTREE {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_entry">CERT_ALT_NAME_ENTRY</a> containing a base name identifier of a certificate.
     */
    Base : CERT_ALT_NAME_ENTRY

    /**
     * Currently not used.
     */
    dwMinimum : UInt32

    /**
     * Currently not used.
     */
    fMaximum : BOOL

    /**
     * Currently not used.
     */
    dwMaximum : UInt32

}
