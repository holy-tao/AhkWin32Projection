#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies parameters for the repair operation.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_data_set_repair_parameters
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DATA_SET_REPAIR_PARAMETERS {
    #StructPack 4

    /**
     * The number of copies that will be repaired.
     */
    NumberOfRepairCopies : UInt32

    /**
     * The copy number of the source copy.
     */
    SourceCopy : UInt32

    /**
     * The copy numbers of all the copies that will be repaired.
     */
    RepairCopies : UInt32[1]

}
