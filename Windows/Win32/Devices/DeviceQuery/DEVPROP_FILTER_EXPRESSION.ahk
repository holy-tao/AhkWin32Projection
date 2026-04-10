#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVPROP_OPERATOR.ahk
#Include ..\Properties\DEVPROPERTY.ahk
#Include ..\Properties\DEVPROPCOMPKEY.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk
#Include ..\Properties\DEVPROPSTORE.ahk
#Include ..\Properties\DEVPROPTYPE.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
class DEVPROP_FILTER_EXPRESSION extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {DEVPROP_OPERATOR}
     */
    Operator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DEVPROPERTY}
     */
    Property {
        get {
            if(!this.HasProp("__Property"))
                this.__Property := DEVPROPERTY(8, this)
            return this.__Property
        }
    }
}
