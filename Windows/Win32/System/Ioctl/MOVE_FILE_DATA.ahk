#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains input data for the FSCTL_MOVE_FILE control code.
 * @remarks
 * To retrieve data to fill in this structure, use the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a> function with the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_retrieval_pointers">FSCTL_GET_RETRIEVAL_POINTERS</a> control 
  *     code.
  * 
  * The first cluster of a directory on a FAT file system volume cannot be moved.
  * 
  * When possible, move data in blocks aligned relative to each other in 16-kilobyte (KB) increments. This reduces copy-on-write overhead when shadow copies are enabled, because shadow copy space is  increased and performance is reduced when the following conditions occur:
  * 
  * <ul>
  * <li>The move request block size is less than or equal to 16 KB.</li>
  * <li>The move delta is not in increments of 16 KB.</li>
  * </ul>
  * The move delta is the number of bytes between the start of the source block and the start of the target block. In other words, a block starting at offset X (on-disk) can be moved to a starting offset Y if the absolute value of X minus Y is an even multiple of 16 KB. So, assuming 4-KB clusters, a move from cluster 3 to cluster 27 will be optimized,  but a move from cluster 18 to cluster 24 will not.  Note that mod(3,4) = 3 = mod(27,4).  Mod 4 is chosen because four clusters at 4 KB each is equivalent to 16 KB.  Therefore, a volume formatted to a 16-KB cluster size will result in all move files being optimized.
  * 
  * For more information about shadow copies, see <a href="https://docs.microsoft.com/windows/desktop/VSS/about-the-volume-shadow-copy-service">Volume Shadow Copy Service</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-move_file_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class MOVE_FILE_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A handle to the file to be moved.
     * 
     * To retrieve a handle to a file, use 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     * 
     * If the file is encrypted, the handle must have the <b>FILE_READ_DATA</b>, 
     *        <b>FILE_WRITE_DATA</b>, <b>FILE_APPEND_DATA</b>, or 
     *        <b>FILE_EXECUTE</b> access right. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>.
     * @type {Pointer<Void>}
     */
    FileHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A VCN (cluster number relative to the beginning of a file) of the first cluster to be moved.
     * @type {Integer}
     */
    StartingVcn {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * An LCN (cluster number on a volume) to which the VCN is to be moved.
     * @type {Integer}
     */
    StartingLcn {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The count of clusters to be moved.
     * @type {Integer}
     */
    ClusterCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
