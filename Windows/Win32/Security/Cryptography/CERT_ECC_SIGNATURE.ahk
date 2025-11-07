#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains the r and s values for an Elliptic Curve Digital Signature Algorithm (ECDSA) signature.
 * @remarks
 * 
 * Before encoding, a leading zero byte will be inserted for the <b>r</b> and <b>s</b> members. After decoding, a leading zero byte will be removed from the <b>r</b> and <b>s</b> members if the leading zero is present.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_ecc_signature
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_ECC_SIGNATURE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The r value of the ECDSA signature. This value is in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">little-endian</a> order.
     * @type {CRYPT_INTEGER_BLOB}
     */
    r{
        get {
            if(!this.HasProp("__r"))
                this.__r := CRYPT_INTEGER_BLOB(0, this)
            return this.__r
        }
    }

    /**
     * The s value of the ECDSA signature. This value is in little-endian order.
     * @type {CRYPT_INTEGER_BLOB}
     */
    s{
        get {
            if(!this.HasProp("__s"))
                this.__s := CRYPT_INTEGER_BLOB(16, this)
            return this.__s
        }
    }
}
