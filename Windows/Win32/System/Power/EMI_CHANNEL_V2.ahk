#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMI_MEASUREMENT_UNIT.ahk" { EMI_MEASUREMENT_UNIT }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The EMI_CHANNEL_V2 structure provides data about an EMI V2 channel.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_channel_v2
 * @namespace Windows.Win32.System.Power
 */
export default struct EMI_CHANNEL_V2 {
    #StructPack 4

    /**
     * An EMI_MEASUREMENT_UNIT that specifies the unit of energy
     *                           measurements that can be obtained from the device from an
     *                           IOCTL_EMI_GET_MEASUREMENT. In EMI_VERSION_V2, the only
     *                           supported unit is picowatt-hours.
     */
    MeasurementUnit : EMI_MEASUREMENT_UNIT

    /**
     * The size of ChannelName in bytes, including the null terminator.
     */
    ChannelNameSize : UInt16

    /**
     * A null-terminated, Unicode string that specifies the channel name.
     */
    ChannelName : WCHAR[1]

}
