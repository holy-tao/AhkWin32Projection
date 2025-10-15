#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\DOT11_SUPPORTED_ANTENNA.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SUPPORTED_ANTENNA_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uNumOfEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<DOT11_SUPPORTED_ANTENNA>}
     */
    dot11SupportedAntenna{
        get {
            if(!this.HasProp("__dot11SupportedAntennaProxyArray"))
                this.__dot11SupportedAntennaProxyArray := Win32FixedArray(this.ptr + 8, 1, DOT11_SUPPORTED_ANTENNA, "")
            return this.__dot11SupportedAntennaProxyArray
        }
    }
}
