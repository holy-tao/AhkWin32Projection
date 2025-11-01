#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_SHELL_STARTUP_INFO_V10.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_shell_startup_info_v11
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
                this.__Base := WSMAN_SHELL_STARTUP_INFO_V10(0, this)
            return this.__Base
        }
    }

    /**
     * @type {PWSTR}
     */
    name {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
