#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_KEYINFO_TYPE.ahk" { CRYPT_XML_KEYINFO_TYPE }
#Import ".\CRYPT_XML_X509DATA_ITEM.ahk" { CRYPT_XML_X509DATA_ITEM }
#Import ".\CRYPT_XML_KEY_VALUE.ahk" { CRYPT_XML_KEY_VALUE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_KEY_VALUE_TYPE.ahk" { CRYPT_XML_KEY_VALUE_TYPE }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import ".\CRYPT_XML_DATA_BLOB.ahk" { CRYPT_XML_DATA_BLOB }
#Import ".\CRYPT_XML_KEY_ECDSA_KEY_VALUE.ahk" { CRYPT_XML_KEY_ECDSA_KEY_VALUE }
#Import ".\CRYPT_XML_KEY_DSA_KEY_VALUE.ahk" { CRYPT_XML_KEY_DSA_KEY_VALUE }
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }
#Import ".\CRYPT_XML_KEY_RSA_KEY_VALUE.ahk" { CRYPT_XML_KEY_RSA_KEY_VALUE }
#Import ".\CRYPT_XML_X509DATA.ahk" { CRYPT_XML_X509DATA }

/**
 * Encapsulates key information data that corresponds to a KeyInfo element. The KeyInfo element enables the recipient to obtain the key needed to validate the signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_info_item
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_KEY_INFO_ITEM {
    #StructPack 8

    /**
     * Specifies the key information type encapsulated in this structure.
     */
    dwType : CRYPT_XML_KEYINFO_TYPE

    wszKeyName : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'KeyValue', { type: CRYPT_XML_KEY_VALUE, offset: 8 })
        DefineProp(this.Prototype, 'RetrievalMethod', { type: CRYPT_XML_BLOB, offset: 8 })
        DefineProp(this.Prototype, 'X509Data', { type: CRYPT_XML_X509DATA, offset: 8 })
        DefineProp(this.Prototype, 'Custom', { type: CRYPT_XML_BLOB, offset: 8 })
        this.DeleteProp("__New")
    }
}
