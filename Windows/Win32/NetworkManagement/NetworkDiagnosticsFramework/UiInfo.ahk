#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ShellCommandInfo.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-uiinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class UiInfo extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PWSTR}
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
                this.__ShellInfo := ShellCommandInfo(8, this)
            return this.__ShellInfo
        }
    }

    /**
     * @type {PWSTR}
     */
    pwzHelpUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pwzDui {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
