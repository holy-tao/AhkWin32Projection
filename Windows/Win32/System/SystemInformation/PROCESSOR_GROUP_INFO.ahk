#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the number and affinity of processors in a processor group.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_group_info
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct PROCESSOR_GROUP_INFO {
    #StructPack 8

    /**
     * The maximum number of processors in the group.
     */
    MaximumProcessorCount : Int8

    /**
     * The number of active processors in the group.
     */
    ActiveProcessorCount : Int8

    /**
     * This member is reserved.
     */
    Reserved : Int8[38]

    /**
     * A bitmap that specifies the affinity for zero or more active processors within the group.
     */
    ActiveProcessorMask : IntPtr

}
