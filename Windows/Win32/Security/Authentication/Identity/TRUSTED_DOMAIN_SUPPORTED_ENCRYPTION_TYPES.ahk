#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_DOMAIN_SUPPORTED_ENCRYPTION_TYPES extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SupportedEncryptionTypes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
