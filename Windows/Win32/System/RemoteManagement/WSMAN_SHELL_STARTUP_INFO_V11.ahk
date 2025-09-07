#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WSMAN_SHELL_STARTUP_INFO_V10.ahk

/**
 * The WSMAN_SHELL_STARTUP_INFO_V11 (wsman.h) structure defines the shell startup parameters to be used with the WSManCreateShell function.
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
                this.__Base := WSMAN_SHELL_STARTUP_INFO_V10(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * Specifies an optional friendly name to be associated with the shell. This parameter is only functional when the client passes the  flag <b>WSMAN_FLAG_REQUESTED_API_VERSION_1_1</b> to WSManInitialize.
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
