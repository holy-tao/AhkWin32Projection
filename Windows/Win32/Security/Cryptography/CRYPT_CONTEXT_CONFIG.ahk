#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_CONTEXT_CONFIG_FLAGS.ahk

/**
 * Contains configuration information for a CNG context.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_context_config
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_CONTEXT_CONFIG extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {CRYPT_CONTEXT_CONFIG_FLAGS}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
