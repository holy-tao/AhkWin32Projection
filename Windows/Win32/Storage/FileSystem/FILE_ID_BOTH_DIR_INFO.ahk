#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about files in the specified directory.
 * @remarks
 * No specific access rights are required to query this information.
 * 
 * File reference numbers, also called file IDs, are guaranteed to be unique only within a static file system. 
 *     They are not guaranteed to be unique over time, because file systems are free to reuse them. Nor are they 
 *     guaranteed to remain constant. For example, the FAT file system generates the file reference number for a file 
 *     from the byte offset of the file's directory entry record (DIRENT) on the disk. Defragmentation can change this 
 *     byte offset. Thus a FAT file reference number can change over time.
 * 
 * All dates and times are in absolute system-time format. Absolute system time is the number of 100-nanosecond 
 *     intervals since the start of the year 1601.
 * 
 * This <b>FILE_ID_BOTH_DIR_INFO</b> structure must be 
 *     aligned on a <b>DWORDLONG</b> (8-byte) boundary. If a buffer contains two or more of these structures, the 
 *     <b>NextEntryOffset</b> value in each entry, except the last, falls on an 8-byte boundary.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_both_dir_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ID_BOTH_DIR_INFO extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The offset for the next <b>FILE_ID_BOTH_DIR_INFO</b> 
     *       structure that is returned. Contains zero (0) if no other entries follow this one.
     * @type {Integer}
     */
    NextEntryOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The byte offset of the file within the parent directory. This member is undefined for file systems, such as 
     *       NTFS, in which the position of a file within the parent directory is not fixed and can be changed at any time to 
     *       maintain sort order.
     * @type {Integer}
     */
    FileIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The time that the file was created.
     * @type {Integer}
     */
    CreationTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The time that the file was last accessed.
     * @type {Integer}
     */
    LastAccessTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The time that the file was last written to.
     * @type {Integer}
     */
    LastWriteTime {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The time that the file was last changed.
     * @type {Integer}
     */
    ChangeTime {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The absolute new end-of-file position as a byte offset from the start of the file to the end of the file. 
     *       Because this value is zero-based, it actually refers to the first free byte in the file. In other words, 
     *       <b>EndOfFile</b> is the offset to the byte that immediately follows the last valid byte in 
     *       the file.
     * @type {Integer}
     */
    EndOfFile {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * The number of bytes that are allocated for the file. This value is usually a multiple of the sector or 
     *       cluster size of the underlying physical device.
     * @type {Integer}
     */
    AllocationSize {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * The file attributes. This member can be any valid combination of the following attributes:
     * @type {Integer}
     */
    FileAttributes {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The length of the file name.
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The size of the extended attributes for the file.
     * @type {Integer}
     */
    EaSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The length of <b>ShortName</b>.
     * @type {Integer}
     */
    ShortNameLength {
        get => NumGet(this, 68, "char")
        set => NumPut("char", value, this, 68)
    }

    /**
     * The short 8.3 file naming convention (for example, 
     *       "FILENAME.TXT") name of the file.
     * @type {String}
     */
    ShortName {
        get => StrGet(this.ptr + 70, 11, "UTF-16")
        set => StrPut(value, this.ptr + 70, 11, "UTF-16")
    }

    /**
     * The file ID.
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * The first character of the file name string. This is followed in memory by the remainder of the 
     *       string.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 104, 0, "UTF-16")
        set => StrPut(value, this.ptr + 104, 0, "UTF-16")
    }
}
