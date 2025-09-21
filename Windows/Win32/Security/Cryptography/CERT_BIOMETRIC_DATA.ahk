#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CERT_HASHED_URL.ahk

/**
 * Contains information about biometric data.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_biometric_data
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_BIOMETRIC_DATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwTypeOfBiometricDataChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwPredefined {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pszObjId {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_hashed_url">CERT_HASHED_URL</a> structure that contains the hashed URL of the biometric data.
     * @type {CERT_HASHED_URL}
     */
    HashedUrl{
        get {
            if(!this.HasProp("__HashedUrl"))
                this.__HashedUrl := CERT_HASHED_URL(this.ptr + 8)
            return this.__HashedUrl
        }
    }
}
