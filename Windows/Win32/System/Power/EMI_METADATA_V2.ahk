#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMI_CHANNEL_V2.ahk

/**
 * The EMI_METADATA_V2 structure provides metadata about a device that supports the EMI_VERSION_V2 interface. This metadata contains information about the hardware device and what EMI channels are exposed by this device.
 * @see https://docs.microsoft.com/windows/win32/api//emi/ns-emi-emi_metadata_v2
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EMI_METADATA_V2 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A null-terminated, Unicode string that contains the name of the OEM.
     * @type {String}
     */
    HardwareOEM {
        get => StrGet(this.ptr + 0, 15, "UTF-16")
        set => StrPut(value, this.ptr + 0, 15, "UTF-16")
    }

    /**
     * A null-terminated, Unicode string that specifies the device model.
     * @type {String}
     */
    HardwareModel {
        get => StrGet(this.ptr + 32, 15, "UTF-16")
        set => StrPut(value, this.ptr + 32, 15, "UTF-16")
    }

    /**
     * A value that specifies the current revision of the device.
     * @type {Integer}
     */
    HardwareRevision {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }

    /**
     * A value that specifies the number of EMI channels that are exposed by this device.
     * @type {Integer}
     */
    ChannelCount {
        get => NumGet(this, 66, "ushort")
        set => NumPut("ushort", value, this, 66)
    }

    /**
     * An array of EMI_CHANNEL_V2 instances that describe the channels exposed by this device.
     * @type {Array<EMI_CHANNEL_V2>}
     */
    Channels{
        get {
            if(!this.HasProp("__ChannelsProxyArray"))
                this.__ChannelsProxyArray := Win32FixedArray(this.ptr + 72, 1, EMI_CHANNEL_V2, "")
            return this.__ChannelsProxyArray
        }
    }
}
