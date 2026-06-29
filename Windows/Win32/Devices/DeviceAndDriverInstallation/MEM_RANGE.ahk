#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MD_FLAGS.ahk" { MD_FLAGS }

/**
 * The MEM_RANGE structure specifies a resource requirements list that describes memory usage for a device instance. For more information about resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-mem_range
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct MEM_RANGE {
    #StructPack 8

    /**
     * Mask used to specify the memory address boundary on which the first allocated memory address must be aligned.
     */
    MR_Align : Int64

    /**
     * The number of bytes of memory required by the device.
     */
    MR_nBytes : UInt32

    /**
     * The lowest-numbered of a range of contiguous memory addresses that can be allocated to the device.
     */
    MR_Min : Int64

    /**
     * The highest-numbered of a range of contiguous memory addresses that can be allocated to the device.
     */
    MR_Max : Int64

    /**
     * One bit flag from [MEM_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-mem_des) structure.
     */
    MR_Flags : MD_FLAGS

    /**
     * <i>For internal use only.</i>
     */
    MR_Reserved : UInt32

}
