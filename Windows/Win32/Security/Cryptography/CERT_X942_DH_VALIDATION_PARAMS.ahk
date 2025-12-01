#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * Optionally pointed to by a member of the CERT_X942_DH_PARAMETERS structure and contains additional seed information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_x942_dh_validation_params
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_X942_DH_VALIDATION_PARAMS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_UINT_BLOB</a> that contains an unsigned seed value.
     * @type {CRYPT_BIT_BLOB}
     */
    seed{
        get {
            if(!this.HasProp("__seed"))
                this.__seed := CRYPT_BIT_BLOB(0, this)
            return this.__seed
        }
    }

    /**
     * A <b>DWORD</b> counter.
     * @type {Integer}
     */
    pgenCounter {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
