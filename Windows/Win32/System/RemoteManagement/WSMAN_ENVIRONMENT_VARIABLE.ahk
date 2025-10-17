#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an individual environment variable by using a name and value pair.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_environment_variable
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_ENVIRONMENT_VARIABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Defines the environment variable name. This parameter cannot be <b>NULL</b>.
     * @type {PWSTR}
     */
    name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Defines the environment variable value. <b>NULL</b> or empty string values are permitted.
     * @type {PWSTR}
     */
    value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
