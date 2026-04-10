#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SUPPORTED_OFDM_FREQUENCY.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_SUPPORTED_OFDM_FREQUENCY_LIST extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

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
     * @type {DOT11_SUPPORTED_OFDM_FREQUENCY}
     */
    dot11SupportedOFDMFrequency {
        get {
            if(!this.HasProp("__dot11SupportedOFDMFrequencyProxyArray"))
                this.__dot11SupportedOFDMFrequencyProxyArray := Win32FixedArray(this.ptr + 8, 1, DOT11_SUPPORTED_OFDM_FREQUENCY, "")
            return this.__dot11SupportedOFDMFrequencyProxyArray
        }
    }
}
