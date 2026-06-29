#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains disk block reassignment data. (REASSIGN_BLOCKS_EX)
 * @remarks
 * The <b>REASSIGN_BLOCKS_EX</b> structure supports drives 
 *     that have an 8-byte Logical Block Address (LBA), which is typically required for storage devices larger than 2 TB. 
 *     The <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-reassign_blocks">REASSIGN_BLOCKS</a> structure used with the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_reassign_blocks">IOCTL_DISK_REASSIGN_BLOCKS</a> control code 
 *     supports devices with up to a 4-byte LBA should be used where possible.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-reassign_blocks_ex
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct REASSIGN_BLOCKS_EX {
    #StructPack 8

    /**
     * This member is reserved. Do not use it. Set it to 0 (zero).
     */
    Reserved : UInt16

    /**
     * The number of blocks to be reassigned. 
     * 
     * This is the number of elements that are in the 
     *       <b>BlockNumber</b> member array.
     */
    Count : UInt16

    /**
     * An array of <b>Count</b> block numbers, one for each block to be reassigned.
     */
    BlockNumber : Int64[1]

}
