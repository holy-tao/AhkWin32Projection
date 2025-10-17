#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a specific option name and value pair.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_option
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_OPTION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the name of the option.
     * @type {PWSTR}
     */
    name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the value of the option.
     * @type {PWSTR}
     */
    value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies whether the option must be understood and complied with.  If this value is <b>TRUE</b>, the plug-in must understand and adhere to the meaning of the option; otherwise, the plug-in must return an error.  If this is <b>FALSE</b>, the plug-in should ignore the option if it is not understood.
     * @type {BOOL}
     */
    mustComply {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
