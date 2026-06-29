#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ALT_NAME_ENTRY.ahk" { CERT_ALT_NAME_ENTRY }

/**
 * The CERT_ALT_NAME_INFO structure is used in encoding and decoding extensions for subject or issuer certificates, Certificate Revocation Lists (CRLs), and Certificate Trust Lists (CTLs).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_alt_name_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_ALT_NAME_INFO {
    #StructPack 8

    /**
     * Number of elements in the <b>rgAltEntry</b> array.
     */
    cAltEntry : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_entry">CERT_ALT_NAME_ENTRY</a> structures.
     */
    rgAltEntry : CERT_ALT_NAME_ENTRY.Ptr

}
