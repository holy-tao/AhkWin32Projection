#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CryptXmlDllDigestData.ahk" { CryptXmlDllDigestData }
#Import ".\CryptXmlDllCloseDigest.ahk" { CryptXmlDllCloseDigest }
#Import ".\CryptXmlDllFinalizeDigest.ahk" { CryptXmlDllFinalizeDigest }
#Import ".\CryptXmlDllEncodeAlgorithm.ahk" { CryptXmlDllEncodeAlgorithm }
#Import ".\CryptXmlDllVerifySignature.ahk" { CryptXmlDllVerifySignature }
#Import ".\CryptXmlDllSignData.ahk" { CryptXmlDllSignData }
#Import ".\CryptXmlDllCreateDigest.ahk" { CryptXmlDllCreateDigest }
#Import ".\CryptXmlDllGetAlgorithmInfo.ahk" { CryptXmlDllGetAlgorithmInfo }

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
    fpCryptXmlEncodeAlgorithm : CryptXmlDllEncodeAlgorithm

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllcreatedigest">CryptXmlDllCreateDigest</a> function.
     */
    fpCryptXmlCreateDigest : CryptXmlDllCreateDigest

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldlldigestdata">CryptXmlDllDigestData</a> function.
     */
    fpCryptXmlDigestData : CryptXmlDllDigestData

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllfinalizedigest">CryptXmlDllFinalizeDigest</a> function.
     */
    fpCryptXmlFinalizeDigest : CryptXmlDllFinalizeDigest

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllclosedigest">CryptXmlDllCloseDigest</a> function.
     */
    fpCryptXmlCloseDigest : CryptXmlDllCloseDigest

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllsigndata">CryptXmlDllSignData</a> function.
     */
    fpCryptXmlSignData : CryptXmlDllSignData

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllverifysignature">CryptXmlDllVerifySignature</a> function.
     */
    fpCryptXmlVerifySignature : CryptXmlDllVerifySignature

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllgetalgorithminfo">CryptXmlDllGetAlgorithmInfo</a> function.
     */
    fpCryptXmlGetAlgorithmInfo : CryptXmlDllGetAlgorithmInfo

}
