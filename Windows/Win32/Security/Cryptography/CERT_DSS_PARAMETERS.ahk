#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains parameters associated with a Digital Signature Standard (DSS) public key algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_dss_parameters
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_DSS_PARAMETERS extends Win32Struct
{
    static sizeof => 48

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
     * Prime Q. It is 20 bytes in length. The most significant bit of the most significant byte must be set to 1.
     * @type {CRYPT_INTEGER_BLOB}
     */
    q{
        get {
            if(!this.HasProp("__q"))
                this.__q := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__q
        }
    }

    /**
     * Generator G. Must be the same length as <b>p</b> (must be padded with 0x00 bytes if it is less).
     * @type {CRYPT_INTEGER_BLOB}
     */
    g{
        get {
            if(!this.HasProp("__g"))
                this.__g := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__g
        }
    }
}
