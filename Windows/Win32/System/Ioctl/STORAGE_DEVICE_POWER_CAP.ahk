#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_DEVICE_POWER_CAP_UNITS.ahk" { STORAGE_DEVICE_POWER_CAP_UNITS }

/**
 * This structure is used as an input and output buffer for the IOCTL_STORAGE_DEVICE_POWER_CAP.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_power_cap
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_POWER_CAP {
    #StructPack 8

    /**
     * The version of this structure. This should be set to STORAGE_DEVICE_POWER_CAP_VERSION_V1.
     */
    Version : UInt32

    /**
     * The size of this structure.
     */
    Size : UInt32

    /**
     * The units of the <i>MaxPower</i> value, of type <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_device_power_cap_units">STORAGE_DEVICE_POWER_CAP_UNITS</a>.
     */
    Units : STORAGE_DEVICE_POWER_CAP_UNITS

    /**
     * Contains the value of the actual maximum power consumption level of the device. This may be equal to, less than, or greater than the desired threshold, depending on what the device supports.
     */
    MaxPower : Int64

}
