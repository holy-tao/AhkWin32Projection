#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk

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
                this.__Key := DEVPROPKEY(0, this)
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
    LocaleName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
