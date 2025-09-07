#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains parameters associated with a Diffie/Hellman public key algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_dh_parameters
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_DH_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Prime modulus P. The most significant bit of the most significant byte must always be set to 1.
     * @type {CRYPT_INTEGER_BLOB}
     */
    p{
        get {
            if(!this.HasProp("__p"))
                this.__p := CRYPT_INTEGER_BLOB(this.ptr + 0)
            return this.__p
        }
    }

    /**
     * Generator G. Must be the same length as <b>p</b> (must be padded with 0x00 bytes if it is less).
     * @type {CRYPT_INTEGER_BLOB}
     */
    g{
        get {
            if(!this.HasProp("__g"))
                this.__g := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__g
        }
    }
}
