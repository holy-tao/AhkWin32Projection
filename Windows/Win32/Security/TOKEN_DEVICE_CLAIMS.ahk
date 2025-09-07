#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Defines the device claims for the token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_device_claims
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_DEVICE_CLAIMS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The device claims for the token.
     * @type {Pointer<Void>}
     */
    DeviceClaims {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
