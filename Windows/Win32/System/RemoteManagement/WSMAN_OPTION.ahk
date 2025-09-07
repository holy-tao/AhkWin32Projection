#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Represents a specific option name and value pair.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_option
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
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PWSTR(this.ptr + 0)
            return this.__name
        }
    }

    /**
     * Specifies the value of the option.
     * @type {PWSTR}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := PWSTR(this.ptr + 8)
            return this.__value
        }
    }

    /**
     * Specifies whether the option must be understood and complied with.  If this value is <b>TRUE</b>, the plug-in must understand and adhere to the meaning of the option; otherwise, the plug-in must return an error.  If this is <b>FALSE</b>, the plug-in should ignore the option if it is not understood.
     * @type {Integer}
     */
    mustComply {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
