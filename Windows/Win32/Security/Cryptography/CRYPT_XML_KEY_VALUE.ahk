#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_KEY_VALUE_TYPE.ahk" { CRYPT_XML_KEY_VALUE_TYPE }
#Import ".\CRYPT_XML_DATA_BLOB.ahk" { CRYPT_XML_DATA_BLOB }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_KEY_RSA_KEY_VALUE.ahk" { CRYPT_XML_KEY_RSA_KEY_VALUE }
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }
#Import ".\CRYPT_XML_KEY_DSA_KEY_VALUE.ahk" { CRYPT_XML_KEY_DSA_KEY_VALUE }
#Import ".\CRYPT_XML_KEY_ECDSA_KEY_VALUE.ahk" { CRYPT_XML_KEY_ECDSA_KEY_VALUE }

/**
 * Contains a single public key that may be useful in validating the signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_value
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_KEY_VALUE {
    #StructPack 8

    /**
     * Specifies the key value type.
     */
    dwType : CRYPT_XML_KEY_VALUE_TYPE

    DSAKeyValue : CRYPT_XML_KEY_DSA_KEY_VALUE

    static __New() {
        DefineProp(this.Prototype, 'RSAKeyValue', { type: CRYPT_XML_KEY_RSA_KEY_VALUE, offset: 8 })
        DefineProp(this.Prototype, 'ECDSAKeyValue', { type: CRYPT_XML_KEY_ECDSA_KEY_VALUE, offset: 8 })
        DefineProp(this.Prototype, 'Custom', { type: CRYPT_XML_BLOB, offset: 8 })
        this.DeleteProp("__New")
    }
}
