#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Devices.Properties
 * @version v4.0.30319
 */
class DEVPROPCOMPKEY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {DEVPROPKEY}
     */
    Key{
        get {
            if(!this.HasProp("__Key"))
                this.__Key := DEVPROPKEY(this.ptr + 0)
            return this.__Key
        }
    }

    /**
     * @type {Integer}
     */
    Store {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    LocaleName{
        get {
            if(!this.HasProp("__LocaleName"))
                this.__LocaleName := PWSTR(this.ptr + 24)
            return this.__LocaleName
        }
    }
}
