#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }

/**
 * Contains an arbitrary array of bytes.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_blob
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_BLOB {
    #StructPack 8

    /**
     * Specifies the character set used to encode the signature.
     */
    dwCharset : CRYPT_XML_CHARSET

    /**
     * The size, in bytes, of this structure.
     * 
     * Range: 0–CRYPT_XML_BLOB_MAX) (value is 0x7FFFFFF8)
     */
    cbData : UInt32

    /**
     * A pointer to encoded XML data.
     */
    pbData : IntPtr

}
