#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMI_CHANNEL_MEASUREMENT_DATA.ahk" { EMI_CHANNEL_MEASUREMENT_DATA }

/**
 * The EMI_MEASUREMENT_DATA_V2 structure provides data about the current energy measurement data for all channels of an EMI_VERSION_V2 device.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_measurement_data_v2
 * @namespace Windows.Win32.System.Power
 */
export default struct EMI_MEASUREMENT_DATA_V2 {
    #StructPack 8

    /**
     * The channel measurement for each channel exposed by this device.
     */
    ChannelData : EMI_CHANNEL_MEASUREMENT_DATA[1]

}
