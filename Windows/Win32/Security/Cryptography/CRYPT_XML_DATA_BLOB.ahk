#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains XML encoded data.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_data_blob
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_DATA_BLOB {
    #StructPack 8

    /**
     * The size, in bytes, of the data buffer pointed to by the <b>pbData</b> member.
     */
    cbData : UInt32

    /**
     * A pointer to the XML data. The maximum length in the buffer cannot exceed <b>CRYPT_XML_BLOB_MAX</b>              bytes.
     */
    pbData : IntPtr

}
