#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMI_CHANNEL_V2.ahk" { EMI_CHANNEL_V2 }
#Import ".\EMI_MEASUREMENT_UNIT.ahk" { EMI_MEASUREMENT_UNIT }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The EMI_METADATA_V2 structure provides metadata about a device that supports the EMI_VERSION_V2 interface. This metadata contains information about the hardware device and what EMI channels are exposed by this device.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_metadata_v2
 * @namespace Windows.Win32.System.Power
 */
export default struct EMI_METADATA_V2 {
    #StructPack 4

    /**
     * A null-terminated, Unicode string that contains the name of the OEM.
     */
    HardwareOEM : WCHAR[16]

    /**
     * A null-terminated, Unicode string that specifies the device model.
     */
    HardwareModel : WCHAR[16]

    /**
     * A value that specifies the current revision of the device.
     */
    HardwareRevision : UInt16

    /**
     * A value that specifies the number of EMI channels that are exposed by this device.
     */
    ChannelCount : UInt16

    /**
     * An array of EMI_CHANNEL_V2 instances that describe the channels exposed by this device.
     */
    Channels : EMI_CHANNEL_V2[1]

}
