#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains parameters associated with a Diffie-Hellman public key algorithm.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_x942_dh_parameters
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_X942_DH_PARAMETERS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Prime modulus P. The most significant bit of the most significant byte must always be set to 1.
     * @type {CRYPT_INTEGER_BLOB}
     */
    p{
        get {
            if(!this.HasProp("__p"))
                this.__p := CRYPT_INTEGER_BLOB(0, this)
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
                this.__g := CRYPT_INTEGER_BLOB(16, this)
            return this.__g
        }
    }

    /**
     * Prime Q. 
     * 
     * 
     * 
     * 
     * A factor of p–1. The most significant bit of the most significant byte must be set to 1.
     * @type {CRYPT_INTEGER_BLOB}
     */
    q{
        get {
            if(!this.HasProp("__q"))
                this.__q := CRYPT_INTEGER_BLOB(32, this)
            return this.__q
        }
    }

    /**
     * Optional subgroup factor.
     * @type {CRYPT_INTEGER_BLOB}
     */
    j{
        get {
            if(!this.HasProp("__j"))
                this.__j := CRYPT_INTEGER_BLOB(48, this)
            return this.__j
        }
    }

    /**
     * Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_x942_dh_validation_params">CERT_X942_DH_VALIDATION_PARAMS</a> structure. If the <b>cbData</b> member of the q BLOB is zero, all of the members of <b>pValidationParams</b> must be zero.
     * @type {Pointer<CERT_X942_DH_VALIDATION_PARAMS>}
     */
    pValidationParams {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
