#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class BATTERY_CHARGER_STATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    VaData{
        get {
            if(!this.HasProp("__VaDataProxyArray"))
                this.__VaDataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__VaDataProxyArray
        }
    }
}
