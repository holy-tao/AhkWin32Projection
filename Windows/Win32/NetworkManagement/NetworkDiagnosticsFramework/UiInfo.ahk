#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\ShellCommandInfo.ahk

/**
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
    pwzNull{
        get {
            if(!this.HasProp("__pwzNull"))
                this.__pwzNull := PWSTR(this.ptr + 8)
            return this.__pwzNull
        }
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
     * @type {PWSTR}
     */
    pwzHelpUrl{
        get {
            if(!this.HasProp("__pwzHelpUrl"))
                this.__pwzHelpUrl := PWSTR(this.ptr + 8)
            return this.__pwzHelpUrl
        }
    }

    /**
     * @type {PWSTR}
     */
    pwzDui{
        get {
            if(!this.HasProp("__pwzDui"))
                this.__pwzDui := PWSTR(this.ptr + 8)
            return this.__pwzDui
        }
    }
}
