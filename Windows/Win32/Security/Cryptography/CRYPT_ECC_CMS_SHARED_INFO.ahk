#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Represents key-encryption key information when using Elliptic Curve Cryptography (ECC) in the Cryptographic Message Syntax (CMS) EnvelopedData content type.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_ecc_cms_shared_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_ECC_CMS_SHARED_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the object identifier of the key-encryption algorithm used to wrap the content-encryption key.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    Algorithm{
        get {
            if(!this.HasProp("__Algorithm"))
                this.__Algorithm := CRYPT_ALGORITHM_IDENTIFIER(0, this)
            return this.__Algorithm
        }
    }

    /**
     * An optional member that contains additional user keying material as an octet string supplied by the sending agent.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EntityUInfo{
        get {
            if(!this.HasProp("__EntityUInfo"))
                this.__EntityUInfo := CRYPT_INTEGER_BLOB(24, this)
            return this.__EntityUInfo
        }
    }

    /**
     * An array of four bytes that represent the length, in bits, of the key-encryption key. The byte array is in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">little-endian</a> order.
     * 
     * 
     * The following table contains the definition of the array dimension.
     * @type {Array<Byte>}
     */
    rgbSuppPubInfo{
        get {
            if(!this.HasProp("__rgbSuppPubInfoProxyArray"))
                this.__rgbSuppPubInfoProxyArray := Win32FixedArray(this.ptr + 40, 4, Primitive, "char")
            return this.__rgbSuppPubInfoProxyArray
        }
    }
}
