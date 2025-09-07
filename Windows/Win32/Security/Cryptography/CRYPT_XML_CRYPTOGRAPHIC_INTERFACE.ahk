#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Exposes the implemented CryptXML functions.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_cryptographic_interface
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_CRYPTOGRAPHIC_INTERFACE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllencodealgorithm">CryptXmlDllEncodeAlgorithm</a> function.
     * @type {Pointer<Ptr>}
     */
    fpCryptXmlEncodeAlgorithm {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllcreatedigest">CryptXmlDllCreateDigest</a> function.
     * @type {Pointer<Ptr>}
     */
    fpCryptXmlCreateDigest {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldlldigestdata">CryptXmlDllDigestData</a> function.
     * @type {Pointer<Ptr>}
     */
    fpCryptXmlDigestData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllfinalizedigest">CryptXmlDllFinalizeDigest</a> function.
     * @type {Pointer<Ptr>}
     */
    fpCryptXmlFinalizeDigest {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllclosedigest">CryptXmlDllCloseDigest</a> function.
     * @type {Pointer<Ptr>}
     */
    fpCryptXmlCloseDigest {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllsigndata">CryptXmlDllSignData</a> function.
     * @type {Pointer<Ptr>}
     */
    fpCryptXmlSignData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllverifysignature">CryptXmlDllVerifySignature</a> function.
     * @type {Pointer<Ptr>}
     */
    fpCryptXmlVerifySignature {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllgetalgorithminfo">CryptXmlDllGetAlgorithmInfo</a> function.
     * @type {Pointer<Ptr>}
     */
    fpCryptXmlGetAlgorithmInfo {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 72
    }
}
