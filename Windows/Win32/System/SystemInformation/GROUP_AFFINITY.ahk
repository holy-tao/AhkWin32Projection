#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a processor group-specific affinity, such as the affinity of a thread.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-group_affinity
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct GROUP_AFFINITY {
    #StructPack 8

    /**
     * A bitmap that specifies the affinity for zero or more processors within the specified group.
     */
    Mask : IntPtr

    /**
     * The processor group number.
     */
    Group : UInt16

    /**
     * This member is reserved.
     */
    Reserved : UInt16[3]

}
