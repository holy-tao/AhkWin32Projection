#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to specify the character set used in the XML.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ne-cryptxml-crypt_xml_charset
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_CHARSET extends Win32Enum {

    /**
     * This value is only supported in the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nf-cryptxml-cryptxmlopentodecode">CryptXmlOpenToDecode</a> function. The encoded XML character set is determined by the parser and is based on the XML declaration or the best guess on the characters.
     * Native name: CRYPT_XML_CHARSET_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 0

    /**
     * Specifies the UTF-8 character set.
     * Native name: CRYPT_XML_CHARSET_UTF8
     * @type {Integer (Int32)}
     */
    static UTF8 => 1

    /**
     * Specifies the UTF-16 little-endian character set.
     * Native name: CRYPT_XML_CHARSET_UTF16LE
     * @type {Integer (Int32)}
     */
    static UTF16LE => 2

    /**
     * Specifies the UTF-16 big-endian character set.
     * Native name: CRYPT_XML_CHARSET_UTF16BE
     * @type {Integer (Int32)}
     */
    static UTF16BE => 3
}
