#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_TRANSFORM_INFO.ahk" { CRYPT_XML_TRANSFORM_INFO }

/**
 * Contains application defined transforms that are allowed for use in the XML digital signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_transform_chain_config
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_TRANSFORM_CHAIN_CONFIG {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The number of elements in the array pointed to by the <b>rgpTransformInfo</b> member.
     */
    cTransformInfo : UInt32

    /**
     * A pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_transform_info">CRYPT_XML_TRANSFORM_INFO</a> structures that contain the transform parameters.
     */
    rgpTransformInfo : IntPtr

}
