#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SR_SECURITY_DESCRIPTOR structure contains information about the security privileges of the user.
 * @see https://docs.microsoft.com/windows/win32/api//subauth/ns-subauth-sr_security_descriptor
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SR_SECURITY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates the size in bytes of the structure.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the user's security privileges.
     * @type {Pointer<Byte>}
     */
    SecurityDescriptor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
