#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the SIM that is used by the EAP method for authentication.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eapsimcredential
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapSimCredential extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A NULL-terminated Unicode string that contains the ICC-ID of the SIM.
     * @type {Pointer<Char>}
     */
    iccID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
