#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The EMI_CHANNEL_V2 structure provides data about an EMI V2 channel.
 * @see https://docs.microsoft.com/windows/win32/api//emi/ns-emi-emi_channel_v2
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EMI_CHANNEL_V2 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An EMI_MEASUREMENT_UNIT that specifies the unit of energy
     *                           measurements that can be obtained from the device from an
     *                           IOCTL_EMI_GET_MEASUREMENT. In EMI_VERSION_V2, the only
     *                           supported unit is picowatt-hours.
     * @type {Integer}
     */
    MeasurementUnit {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size of ChannelName in bytes, including the null terminator.
     * @type {Integer}
     */
    ChannelNameSize {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * A null-terminated, Unicode string that specifies the channel name.
     * @type {String}
     */
    ChannelName {
        get => StrGet(this.ptr + 6, 0, "UTF-16")
        set => StrPut(value, this.ptr + 6, 0, "UTF-16")
    }
}
