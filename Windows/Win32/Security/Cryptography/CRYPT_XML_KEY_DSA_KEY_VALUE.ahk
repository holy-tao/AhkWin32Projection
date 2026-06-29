#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_DATA_BLOB.ahk" { CRYPT_XML_DATA_BLOB }

/**
 * Defines a Digital Signature Algorithm (DSA) key value. The CRYPT_XML_KEY_DSA_KEY_VALUE structure is used as an element of the key value union in the CRYPT_XML_KEY_VALUE structure.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_dsa_key_value
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_KEY_DSA_KEY_VALUE {
    #StructPack 8

    /**
     * Defines the  P part of the DSA key.
     */
    P : CRYPT_XML_DATA_BLOB

    /**
     * Defines the  Q part of the DSA key.
     */
    Q : CRYPT_XML_DATA_BLOB

    /**
     * Defines the  G part of the DSA key.
     */
    G : CRYPT_XML_DATA_BLOB

    /**
     * Defines the Y  part of the DSA key.
     */
    Y : CRYPT_XML_DATA_BLOB

    /**
     * Defines the J part of the DSA key.
     */
    J : CRYPT_XML_DATA_BLOB

    /**
     * The seed value, in big-endian format.
     */
    Seed : CRYPT_XML_DATA_BLOB

    /**
     * The count value, in big-endian format.
     */
    Counter : CRYPT_XML_DATA_BLOB

}
