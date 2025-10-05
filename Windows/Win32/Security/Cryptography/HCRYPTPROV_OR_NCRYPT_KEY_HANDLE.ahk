#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used as a handle to a CryptoAPI cryptographic service provider (CSP) or CNG CSP.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/hcryptprov-or-ncrypt-key-handle
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class HCRYPTPROV_OR_NCRYPT_KEY_HANDLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
