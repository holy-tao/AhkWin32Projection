#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Exposes the implemented CryptXML functions.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_cryptographic_interface
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_CRYPTOGRAPHIC_INTERFACE {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllencodealgorithm">CryptXmlDllEncodeAlgorithm</a> function.
     */
    fpCryptXmlEncodeAlgorithm : IntPtr

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllcreatedigest">CryptXmlDllCreateDigest</a> function.
     */
    fpCryptXmlCreateDigest : IntPtr

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldlldigestdata">CryptXmlDllDigestData</a> function.
     */
    fpCryptXmlDigestData : IntPtr

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllfinalizedigest">CryptXmlDllFinalizeDigest</a> function.
     */
    fpCryptXmlFinalizeDigest : IntPtr

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllclosedigest">CryptXmlDllCloseDigest</a> function.
     */
    fpCryptXmlCloseDigest : IntPtr

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllsigndata">CryptXmlDllSignData</a> function.
     */
    fpCryptXmlSignData : IntPtr

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllverifysignature">CryptXmlDllVerifySignature</a> function.
     */
    fpCryptXmlVerifySignature : IntPtr

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllgetalgorithminfo">CryptXmlDllGetAlgorithmInfo</a> function.
     */
    fpCryptXmlGetAlgorithmInfo : IntPtr

}
