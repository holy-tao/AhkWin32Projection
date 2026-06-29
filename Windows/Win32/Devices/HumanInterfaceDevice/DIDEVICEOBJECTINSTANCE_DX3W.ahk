#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
class DIDEVICEOBJECTINSTANCE_DX3W extends Win32Struct {
    static sizeof => 552

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
    guidType {
        get {
            if(!this.HasProp("__guidType"))
                this.__guidType := Guid(4, this)
            return this.__guidType
        }
    }

    /**
     * @type {Integer}
     */
    dwOfs {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {String}
     */
    tszName {
        get => StrGet(this.ptr + 32, 259, "UTF-16")
        set => StrPut(value, this.ptr + 32, 259, "UTF-16")
    }
}
