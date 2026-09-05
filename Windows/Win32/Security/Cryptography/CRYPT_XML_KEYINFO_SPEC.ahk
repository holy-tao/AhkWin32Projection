#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values for the dwKeyInfoSpec parameter in the CryptXmlSign function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ne-cryptxml-crypt_xml_keyinfo_spec
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_KEYINFO_SPEC extends Win32Enum {

    /**
     * The value of the <b>KeyInfo</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_signature">CRYPT_XML_SIGNATURE</a> structure is null.
     * Native name: CRYPT_XML_KEYINFO_SPEC_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The value of the encoded <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_key_info">CRYPT_XML_KEY_INFO</a> structure is specified in a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_blob">CRYPT_XML_BLOB</a> structure pointed to in the <i>pvKeyInfoSpec</i> parameter.
     * Native name: CRYPT_XML_KEYINFO_SPEC_ENCODED
     * @type {Integer (Int32)}
     */
    static ENCODED => 1

    /**
     * The members  of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_key_info">CRYPT_XML_KEY_INFO</a> structure to be encoded are specified in a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_keyinfo_param">CRYPT_XML_KEYINFO_PARAM</a> structure pointed by the <i>pvKeyInfoSpec</i> parameter.
     * Native name: CRYPT_XML_KEYINFO_SPEC_PARAM
     * @type {Integer (Int32)}
     */
    static PARAM => 2
}
