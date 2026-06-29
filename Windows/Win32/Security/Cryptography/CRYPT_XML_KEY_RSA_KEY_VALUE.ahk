#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_DATA_BLOB.ahk" { CRYPT_XML_DATA_BLOB }

/**
 * Defines an RSA key value. The CRYPT_XML_KEY_RSA_KEY_VALUE structure is used as element of the key value union in the CRYPT_XML_KEY_VALUE structure.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_rsa_key_value
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_KEY_RSA_KEY_VALUE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_data_blob">CRYPT_XML_DATA_BLOB</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> modulus data.
     */
    Modulus : CRYPT_XML_DATA_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_data_blob">CRYPT_XML_DATA_BLOB</a> structure that contains the public key exponent data.
     */
    Exponent : CRYPT_XML_DATA_BLOB

}
