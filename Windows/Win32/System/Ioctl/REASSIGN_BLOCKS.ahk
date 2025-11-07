#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains disk block reassignment data.
 * @remarks
 * 
 * The <b>REASSIGN_BLOCKS</b> structure only supports 
 *     drives where the Logical Block Address (LBA) is a 4-byte value (typically up to 2 TB). 
 * 
 * For larger drives the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-reassign_blocks_ex">REASSIGN_BLOCKS_EX</a> structure that is  used with the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_reassign_blocks_ex">IOCTL_DISK_REASSIGN_BLOCKS_EX</a> control code 
 *     supports 8-byte LBAs.
 * 
 * For device compatibility, the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_reassign_blocks">IOCTL_DISK_REASSIGN_BLOCKS</a> control code and 
 *     <b>REASSIGN_BLOCKS</b> structure should be used where 
 *     possible.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-reassign_blocks
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class REASSIGN_BLOCKS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This member is reserved. Do not use it. Set it to zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The number of blocks to be reassigned. 
     * 
     * This is the number of elements that are in the 
     *       <b>BlockNumber</b> member array.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * An array of <b>Count</b> block numbers, one for each block to be reassigned.
     * @type {Array<UInt32>}
     */
    BlockNumber{
        get {
            if(!this.HasProp("__BlockNumberProxyArray"))
                this.__BlockNumberProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__BlockNumberProxyArray
        }
    }
}
