#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BUSNUMBER_RANGE structure specifies a resource requirements list that describes bus number usage for a device instance. For more information about resource requirements lists, see Hardware Resources.
 * @remarks
 * The BUSNUMBER_RANGE structure is included as a member of the [BUSNUMBER_RESOURCE](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-busnumber_resource) structure.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-busnumber_range
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct BUSNUMBER_RANGE {
    #StructPack 4

    /**
     * The lowest-numbered of a range of contiguous bus numbers that can be allocated to the device.
     */
    BUSR_Min : UInt32

    /**
     * The highest-numbered of a range of contiguous bus numbers that can be allocated to the device.
     */
    BUSR_Max : UInt32

    /**
     * The number of contiguous bus numbers required by the device.
     */
    BUSR_nBusNumbers : UInt32

    /**
     * <i>Not used.</i>
     */
    BUSR_Flags : UInt32

}
