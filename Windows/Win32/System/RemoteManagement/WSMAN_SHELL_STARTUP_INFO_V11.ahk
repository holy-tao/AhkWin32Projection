#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WSMAN_SHELL_STARTUP_INFO_V10.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_SHELL_STARTUP_INFO_V11 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {WSMAN_SHELL_STARTUP_INFO_V10}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := WSMAN_SHELL_STARTUP_INFO_V10(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * @type {PWSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PWSTR(this.ptr + 40)
            return this.__name
        }
    }
}
