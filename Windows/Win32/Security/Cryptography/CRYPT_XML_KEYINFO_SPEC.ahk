#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies values for the dwKeyInfoSpec parameter in the CryptXmlSign function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ne-cryptxml-crypt_xml_keyinfo_spec
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_KEYINFO_SPEC{

    /**
     * The value of the <b>KeyInfo</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_signature">CRYPT_XML_SIGNATURE</a> structure is null.
     * @type {Integer (Int32)}
     */
    static CRYPT_XML_KEYINFO_SPEC_NONE => 0

    /**
     * The value of the encoded <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_key_info">CRYPT_XML_KEY_INFO</a> structure is specified in a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_blob">CRYPT_XML_BLOB</a> structure pointed to in the <i>pvKeyInfoSpec</i> parameter.
     * @type {Integer (Int32)}
     */
    static CRYPT_XML_KEYINFO_SPEC_ENCODED => 1

    /**
     * The members  of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_key_info">CRYPT_XML_KEY_INFO</a> structure to be encoded are specified in a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_keyinfo_param">CRYPT_XML_KEYINFO_PARAM</a> structure pointed by the <i>pvKeyInfoSpec</i> parameter.
     * @type {Integer (Int32)}
     */
    static CRYPT_XML_KEYINFO_SPEC_PARAM => 2
}
