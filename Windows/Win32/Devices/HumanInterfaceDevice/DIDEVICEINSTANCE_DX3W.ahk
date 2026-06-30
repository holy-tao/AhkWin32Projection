#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
class DIDEVICEINSTANCE_DX3W extends Win32Struct {
    static sizeof => 1080

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidInstance {
        get {
            if(!this.HasProp("__guidInstance"))
                this.__guidInstance := Guid(4, this)
            return this.__guidInstance
        }
    }

    /**
     * @type {Guid}
     */
    guidProduct {
        get {
            if(!this.HasProp("__guidProduct"))
                this.__guidProduct := Guid(20, this)
            return this.__guidProduct
        }
    }

    /**
     * @type {Integer}
     */
    dwDevType {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {String}
     */
    tszInstanceName {
        get => StrGet(this.ptr + 40, 259, "UTF-16")
        set => StrPut(value, this.ptr + 40, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    tszProductName {
        get => StrGet(this.ptr + 560, 259, "UTF-16")
        set => StrPut(value, this.ptr + 560, 259, "UTF-16")
    }
}
