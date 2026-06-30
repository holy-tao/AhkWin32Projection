#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
class DIDEVICEINSTANCEA extends Win32Struct {
    static sizeof => 580

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
        get => StrGet(this.ptr + 40, 259, "UTF-8")
        set => StrPut(value, this.ptr + 40, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    tszProductName {
        get => StrGet(this.ptr + 300, 259, "UTF-8")
        set => StrPut(value, this.ptr + 300, 259, "UTF-8")
    }

    /**
     * @type {Guid}
     */
    guidFFDriver {
        get {
            if(!this.HasProp("__guidFFDriver"))
                this.__guidFFDriver := Guid(560, this)
            return this.__guidFFDriver
        }
    }

    /**
     * @type {Integer}
     */
    wUsagePage {
        get => NumGet(this, 576, "ushort")
        set => NumPut("ushort", value, this, 576)
    }

    /**
     * @type {Integer}
     */
    wUsage {
        get => NumGet(this, 578, "ushort")
        set => NumPut("ushort", value, this, 578)
    }
}
