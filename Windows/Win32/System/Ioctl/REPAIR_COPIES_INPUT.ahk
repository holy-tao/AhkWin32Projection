#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Input structure for the FSCTL_REPAIR_COPIES control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-repair_copies_input
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct REPAIR_COPIES_INPUT {
    #StructPack 8

    /**
     * Set to <c>sizeof(REPAIR_COPIES_INPUT)</c>.
     */
    Size : UInt32

    /**
     * Reserved (must be zero)
     */
    Flags : UInt32

    /**
     * The file position to start the repair operation.
     */
    FileOffset : Int64

    /**
     * The number of bytes to be repaired.
     */
    Length : UInt32

    /**
     * The zero-based copy number of the source copy.
     */
    SourceCopy : UInt32

    /**
     * The number of copies that will be repaired. This is the size of the <b>RepairCopies</b> 
     *       array.
     */
    NumberOfRepairCopies : UInt32

    /**
     * The zero-based copy numbers of the copies that will be repaired.
     */
    RepairCopies : UInt32[1]

}
