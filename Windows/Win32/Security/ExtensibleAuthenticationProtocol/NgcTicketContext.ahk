#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class NgcTicketContext extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {String}
     */
    wszTicket {
        get => StrGet(this.ptr + 0, 44, "UTF-16")
        set => StrPut(value, this.ptr + 0, 44, "UTF-16")
    }

    /**
     * @type {Pointer}
     */
    hKey {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    hImpersonateToken {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
