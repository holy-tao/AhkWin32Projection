#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MI_UsernamePasswordCreds.ahk

/**
 * A user's credentials. It includes an authentication type and either a username and password or a certificate thumbprint.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_usercredentials
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_UserCredentials extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Pointer<UInt16>}
     */
    authenticationType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {MI_UsernamePasswordCreds}
     */
    usernamePassword{
        get {
            if(!this.HasProp("__usernamePassword"))
                this.__usernamePassword := MI_UsernamePasswordCreds(this.ptr + 8)
            return this.__usernamePassword
        }
    }

    /**
     * @type {Pointer<UInt16>}
     */
    certificateThumbprint {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
