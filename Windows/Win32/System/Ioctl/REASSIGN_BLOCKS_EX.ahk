#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains disk block reassignment data.
 * @remarks
 * 
 * The <b>REASSIGN_BLOCKS_EX</b> structure supports drives 
 *     that have an 8-byte Logical Block Address (LBA), which is typically required for storage devices larger than 2 TB. 
 *     The <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-reassign_blocks">REASSIGN_BLOCKS</a> structure used with the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_reassign_blocks">IOCTL_DISK_REASSIGN_BLOCKS</a> control code 
 *     supports devices with up to a 4-byte LBA should be used where possible.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-reassign_blocks_ex
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class REASSIGN_BLOCKS_EX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This member is reserved. Do not use it. Set it to 0 (zero).
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
     * @type {Array<Int64>}
     */
    BlockNumber{
        get {
            if(!this.HasProp("__BlockNumberProxyArray"))
                this.__BlockNumberProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "int64")
            return this.__BlockNumberProxyArray
        }
    }
}
