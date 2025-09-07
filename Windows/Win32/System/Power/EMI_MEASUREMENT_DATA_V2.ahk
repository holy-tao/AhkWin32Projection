#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMI_CHANNEL_MEASUREMENT_DATA.ahk

/**
 * The EMI_MEASUREMENT_DATA_V2 structure provides data about the current energy measurement data for all channels of an EMI_VERSION_V2 device.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_measurement_data_v2
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EMI_MEASUREMENT_DATA_V2 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The channel measurement for each channel exposed by this device.
     * @type {Array<EMI_CHANNEL_MEASUREMENT_DATA>}
     */
    ChannelData{
        get {
            if(!this.HasProp("__ChannelDataProxyArray"))
                this.__ChannelDataProxyArray := Win32FixedArray(this.ptr + 0, 8, EMI_CHANNEL_MEASUREMENT_DATA, "")
            return this.__ChannelDataProxyArray
        }
    }
}
