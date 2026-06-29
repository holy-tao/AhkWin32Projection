#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_SIGNATURE.ahk" { CRYPT_XML_SIGNATURE }
#Import ".\CRYPT_XML_TRANSFORM_CHAIN_CONFIG.ahk" { CRYPT_XML_TRANSFORM_CHAIN_CONFIG }

/**
 * Defines document context information.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_doc_ctxt
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_DOC_CTXT {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The handle of the document context.
     */
    hDocCtxt : IntPtr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_transform_chain_config">CRYPT_XML_TRANSFORM_CHAIN_CONFIG</a> structure that contains information about the transform chain engine.
     */
    pTransformsConfig : CRYPT_XML_TRANSFORM_CHAIN_CONFIG.Ptr

    /**
     * The number of elements in the array pointed to by the <b>rgpSignature</b> member.
     */
    cSignature : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_signature">CRYPT_XML_SIGNATURE</a> structures that contain XML signature information.
     */
    rgpSignature : IntPtr

}
