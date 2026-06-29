#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }

/**
 * Contains certificate extension control attributes to be added to a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_add_extensions_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_ADD_EXTENSIONS_INFO {
    #StructPack 8

    /**
     * <b>DWORD</b> data reference number.
     */
    dwCmcDataReference : UInt32

    /**
     * <b>DWORD</b> count of elements in the <b>rgdwCertReference</b> array.
     */
    cCertReference : UInt32

    /**
     * Array of certificate reference numbers.
     */
    rgdwCertReference : IntPtr

    /**
     * <b>DWORD</b> count of the elements in the <b>rgExtension</b> array.
     */
    cExtension : UInt32

    /**
     * Array of pointers to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> certificate extensions to be added.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
