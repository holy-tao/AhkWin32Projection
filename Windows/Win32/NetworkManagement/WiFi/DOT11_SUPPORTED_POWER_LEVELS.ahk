#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SUPPORTED_POWER_LEVELS extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    uNumOfSupportedPowerLevels {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    uTxPowerLevelValues{
        get {
            if(!this.HasProp("__uTxPowerLevelValuesProxyArray"))
                this.__uTxPowerLevelValuesProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__uTxPowerLevelValuesProxyArray
        }
    }
}
