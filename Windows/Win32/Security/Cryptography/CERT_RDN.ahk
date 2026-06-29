#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_RDN_ATTR.ahk" { CERT_RDN_ATTR }

/**
 * The CERT_RDN structure contains a relative distinguished name (RDN) consisting of an array of CERT_RDN_ATTR structures.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_rdn
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_RDN {
    #StructPack 8

    /**
     * Number of elements in the <b>rgRDNAttr</b> array.
     */
    cRDNAttr : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_rdn_attr">CERT_RDN_ATTR</a> structures.
     */
    rgRDNAttr : CERT_RDN_ATTR.Ptr

}
