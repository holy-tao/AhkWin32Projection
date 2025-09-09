#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class SENSOR_PROPERTY_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AllocatedSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<PROPERTYKEY>}
     */
    List{
        get {
            if(!this.HasProp("__ListProxyArray"))
                this.__ListProxyArray := Win32FixedArray(this.ptr + 8, 1, PROPERTYKEY, "")
            return this.__ListProxyArray
        }
    }
}
