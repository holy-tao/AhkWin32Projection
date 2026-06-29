#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCOMPONENTID extends Win32Struct {
    static sizeof => 72

    static packingSize => 4

    /**
     * @type {Guid}
     */
    Manufacturer {
        get {
            if(!this.HasProp("__Manufacturer"))
                this.__Manufacturer := Guid(0, this)
            return this.__Manufacturer
        }
    }

    /**
     * @type {Guid}
     */
    Product {
        get {
            if(!this.HasProp("__Product"))
                this.__Product := Guid(16, this)
            return this.__Product
        }
    }

    /**
     * @type {Guid}
     */
    Component {
        get {
            if(!this.HasProp("__Component"))
                this.__Component := Guid(32, this)
            return this.__Component
        }
    }

    /**
     * @type {Guid}
     */
    Name {
        get {
            if(!this.HasProp("__Name"))
                this.__Name := Guid(48, this)
            return this.__Name
        }
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
