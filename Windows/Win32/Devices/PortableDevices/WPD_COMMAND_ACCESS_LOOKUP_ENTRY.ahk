#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_COMMAND_ACCESS_LOOKUP_ENTRY extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {PROPERTYKEY}
     */
    Command {
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
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {PROPERTYKEY}
     */
    AccessProperty {
        get {
            if(!this.HasProp("__AccessProperty"))
                this.__AccessProperty := PROPERTYKEY(24, this)
            return this.__AccessProperty
        }
    }
}
