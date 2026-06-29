#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTE.ahk" { CRYPT_ATTRIBUTE }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used in the CMC_DATA_INFO and CMC_RESPONSE_INFO structures. (CMC_TAGGED_ATTRIBUTE)
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_tagged_attribute
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_TAGGED_ATTRIBUTE {
    #StructPack 8

    /**
     * A <b>DWORD</b> value that identifies the tagged attribute.
     */
    dwBodyPartID : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structure that contains the attribute.
     */
    Attribute : CRYPT_ATTRIBUTE

}
