#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_RDN.ahk" { CERT_RDN }

/**
 * Contains subject or issuer names.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_name_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_NAME_INFO {
    #StructPack 8

    /**
     * Number of elements in the <b>rgRDN</b> array.
     */
    cRDN : UInt32

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_rdn">CERT_RDN</a> structures.
     */
    rgRDN : CERT_RDN.Ptr

}
