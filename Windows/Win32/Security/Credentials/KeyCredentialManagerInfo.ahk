#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Data structure returned from KeyCredentialManagerGetInformation.
 * @see https://learn.microsoft.com/windows/win32/api/keycredmgr/ns-keycredmgr-keycredentialmanagerinfo
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class KeyCredentialManagerInfo extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Unique identifier of the users WHFB container. Only one container per Windows user profile.
     * @type {Pointer<Guid>}
     */
    containerId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
