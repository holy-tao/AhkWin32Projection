#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTE.ahk" { CRYPT_ATTRIBUTE }

/**
 * Contains an array of attributes.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_attributes
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ATTRIBUTES {
    #StructPack 8

    /**
     * Number of elements in the <b>rgAttr</b> array.
     */
    cAttr : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures.
     */
    rgAttr : CRYPT_ATTRIBUTE.Ptr

}
