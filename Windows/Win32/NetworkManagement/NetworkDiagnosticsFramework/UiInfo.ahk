#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ShellCommandInfo.ahk

/**
 * The UiInfo structure is used to display repair messages to the user.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-uiinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class UiInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/ndattrib/ne-ndattrib-ui_info_type">UI_INFO_TYPE</a></b>
     * 
     * The type of user interface (UI) to use. This can be one of the values shown in the following members.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    pwzNull {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {ShellCommandInfo}
     */
    ShellInfo{
        get {
            if(!this.HasProp("__ShellInfo"))
                this.__ShellInfo := ShellCommandInfo(this.ptr + 8)
            return this.__ShellInfo
        }
    }

    /**
     * @type {Pointer<Char>}
     */
    pwzHelpUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Char>}
     */
    pwzDui {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
