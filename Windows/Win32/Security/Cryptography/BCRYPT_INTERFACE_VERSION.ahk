#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains version information for a programmatic interface for a CNG provider.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_interface_version
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_INTERFACE_VERSION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The major version of the programmatic interface.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The minor version of the programmatic interface.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
