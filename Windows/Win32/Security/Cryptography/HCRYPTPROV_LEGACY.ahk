#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to replace the HCRYPTPROV data type where the HCRYPTPROV data type is no longer used. Function parameters and data structures that are of type HCRYPTPROV\_LEGACY should be set to NULL.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/hcryptprov-legacy
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class HCRYPTPROV_LEGACY extends Win32Struct
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
