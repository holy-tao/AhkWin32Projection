#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import ".\CRYPT_XML_DATA_BLOB.ahk" { CRYPT_XML_DATA_BLOB }
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }

/**
 * Defines an Elliptic Curve Digital Signature Algorithm (ECDSA) key value. The CRYPT_XML_KEY_ECDSA_KEY_VALUE structure is used as an element of the key value union in the CRYPT_XML_KEY_VALUE structure.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_ecdsa_key_value
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_KEY_ECDSA_KEY_VALUE {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of the named curve.
     */
    wszNamedCurve : PWSTR

    /**
     * Defines the X value of an ECDSA curve.
     */
    X : CRYPT_XML_DATA_BLOB

    /**
     * Defines the Y value of an ECDSA curve.
     */
    Y : CRYPT_XML_DATA_BLOB

    /**
     * A   <b>CRYPT_XML_BLOB</b> value that defines the encoded parameters of an ECDSA curve.
     */
    ExplicitPara : CRYPT_XML_BLOB

}
