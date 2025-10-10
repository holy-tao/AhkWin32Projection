#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A username/password combination used for subscription operations.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_usernamepasswordcreds
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_UsernamePasswordCreds extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The Domain <b>username</b> resides in.
     * @type {Pointer<UInt16>}
     */
    domain {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The <b>username</b> in <b>domain</b>.
     * @type {Pointer<UInt16>}
     */
    username {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The password for <b>username</b>.
     * @type {Pointer<UInt16>}
     */
    password {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
