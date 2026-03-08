#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Hash algorithms
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_algorithm_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_GROUP_ID extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_GROUP_ID_HASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_GROUP_ID_SIGN => 2
}
