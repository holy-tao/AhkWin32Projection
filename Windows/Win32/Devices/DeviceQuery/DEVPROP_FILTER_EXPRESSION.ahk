#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk
#Include ..\Properties\DEVPROPCOMPKEY.ahk
#Include ..\Properties\DEVPROPERTY.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 * @version v4.0.30319
 */
class DEVPROP_FILTER_EXPRESSION extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Operator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DEVPROPERTY}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := DEVPROPERTY(this.ptr + 8)
            return this.__Property
        }
    }
}
