#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_TRANSFORM_FLAGS.ahk" { CRYPT_XML_TRANSFORM_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information that is used when applying the data transform.
 * @remarks
 * For XML canonicalization transforms, the buffer size specified by the <b>cbBufferSize</b> member must be large enough to accommodate an entire <b>Start</b> element with all attribute values.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_transform_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_TRANSFORM_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a null-terminated Unicode string that contains the <b>Algorithm</b> attribute.
     */
    wszAlgorithm : PWSTR

    /**
     * The size, in bytes, of the data provider's buffer. The size can be zero if the size cannot be determined at initialization time.
     *     This value is used by a caller of the structure pointed to by the <b>pfnCreateTransform</b> member to determine the necessary size of the receiving buffer.
     */
    cbBufferSize : UInt32

    /**
     * Specifies values that control how the transform is applied.
     */
    dwFlags : CRYPT_XML_TRANSFORM_FLAGS

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-pfn_crypt_xml_create_transform">PFN_CRYPT_XML_CREATE_TRANSFORM</a> callback function used to create the transform.
     */
    pfnCreateTransform : IntPtr

}
