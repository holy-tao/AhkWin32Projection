#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTE.ahk" { CRYPT_ATTRIBUTE }

/**
 * Contains certificate attributes to be added to a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_add_attributes_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_ADD_ATTRIBUTES_INFO {
    #StructPack 8

    /**
     * <b>DWORD</b> data reference number.
     */
    dwCmcDataReference : UInt32

    /**
     * Count of elements in the <b>rgdwCertReference</b> array.
     */
    cCertReference : UInt32

    /**
     * Array of certificate reference numbers.
     */
    rgdwCertReference : IntPtr

    /**
     * Count of the elements in the <b>rgAttribute</b> array.
     */
    cAttribute : UInt32

    /**
     * Array of pointers to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> certificate attributes to be added.
     */
    rgAttribute : CRYPT_ATTRIBUTE.Ptr

}
