#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_COMMAND_ACCESS_LOOKUP_ENTRY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PROPERTYKEY}
     */
    Command{
        get {
            if(!this.HasProp("__Command"))
                this.__Command := PROPERTYKEY(0, this)
            return this.__Command
        }
    }

    /**
     * @type {Integer}
     */
    AccessType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PROPERTYKEY}
     */
    AccessProperty{
        get {
            if(!this.HasProp("__AccessProperty"))
                this.__AccessProperty := PROPERTYKEY(24, this)
            return this.__AccessProperty
        }
    }
}
