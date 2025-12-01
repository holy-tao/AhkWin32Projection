#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_ID_128.ahk

/**
 * Contains identification information for a file. (FILE_ID_EXTD_DIR_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_extd_dir_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ID_EXTD_DIR_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The offset for the next <b>FILE_ID_EXTD_DIR_INFO</b> 
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
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_ARCHIVE"></a><a id="file_attribute_archive"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_ARCHIVE</b></dt>
     * <dt>32 (0x20)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file or directory that is an archive file or directory. Applications typically use this attribute to 
     *         mark files for backup or removal . 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_COMPRESSED"></a><a id="file_attribute_compressed"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_COMPRESSED</b></dt>
     * <dt>2048 (0x800)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file or directory that is compressed. For a file, all of the data in the file is compressed. For a 
     *         directory, compression is the default for newly created files and subdirectories.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_DEVICE"></a><a id="file_attribute_device"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_DEVICE</b></dt>
     * <dt>64 (0x40)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is reserved for system use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_DIRECTORY"></a><a id="file_attribute_directory"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_DIRECTORY</b></dt>
     * <dt>16 (0x10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle that identifies a directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_ENCRYPTED"></a><a id="file_attribute_encrypted"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_ENCRYPTED</b></dt>
     * <dt>16384 (0x4000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file or directory that is encrypted. For a file, all data streams in the file are encrypted. For a 
     *         directory, encryption is the default for newly created files and subdirectories.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_HIDDEN"></a><a id="file_attribute_hidden"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_HIDDEN</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is hidden. It is not included in an ordinary directory listing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_NORMAL"></a><a id="file_attribute_normal"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_NORMAL</b></dt>
     * <dt>128 (0x80)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file that does not have other attributes set. This attribute is valid only when used alone.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_NOT_CONTENT_INDEXED"></a><a id="file_attribute_not_content_indexed"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_NOT_CONTENT_INDEXED</b></dt>
     * <dt>8192 (0x2000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is not to be indexed by the content indexing service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_OFFLINE"></a><a id="file_attribute_offline"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_OFFLINE</b></dt>
     * <dt>4096 (0x1000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data of a file is not available immediately. This attribute indicates that the file data is 
     *         physically moved to offline storage. This attribute is used by Remote Storage, which is the hierarchical 
     *         storage management software. Applications should not arbitrarily change this attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_READONLY"></a><a id="file_attribute_readonly"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_READONLY</b></dt>
     * <dt>1 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file that is read-only. Applications can read the file, but cannot write to it or delete it. This 
     *         attribute is not honored on directories. For more information, see 
     *         <a href="https://support.microsoft.com/kb/326549">You cannot view or change the Read-only or the System attributes of folders in Windows Server 2003, in Windows XP, in Windows Vista or in Windows 7</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_REPARSE_POINT"></a><a id="file_attribute_reparse_point"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_REPARSE_POINT</b></dt>
     * <dt>1024 (0x400)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file or directory that has an associated reparse point, or a file that is a symbolic link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_SPARSE_FILE"></a><a id="file_attribute_sparse_file"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_SPARSE_FILE</b></dt>
     * <dt>512 (0x200)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file that is a sparse file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_SYSTEM"></a><a id="file_attribute_system"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_SYSTEM</b></dt>
     * <dt>4 (0x4)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file or directory that the operating system uses a part of, or uses exclusively.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_TEMPORARY"></a><a id="file_attribute_temporary"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_TEMPORARY</b></dt>
     * <dt>256 (0x100)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file that is being used for temporary storage. File systems avoid writing data back to mass storage if 
     *         sufficient cache memory is available, because typically, an application deletes a temporary file after the 
     *         handle is closed. In that scenario, the system can entirely avoid writing the data. Otherwise, the data is 
     *         written after the handle is closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_ATTRIBUTE_VIRTUAL"></a><a id="file_attribute_virtual"></a><dl>
     * <dt><b>FILE_ATTRIBUTE_VIRTUAL</b></dt>
     * <dt>65536 (0x10000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is reserved for system use.
     * 
     * </td>
     * </tr>
     * </table>
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
     * If the <b>FileAttributes</b> member includes the 
     *        <b>FILE_ATTRIBUTE_REPARSE_POINT</b> attribute, this member specifies the reparse point 
     *        tag.
     * 
     * Otherwise, this value is undefined and should not be used.
     * 
     * For more information see <a href="https://docs.microsoft.com/windows/desktop/FileIO/reparse-point-tags">Reparse Point Tags</a>.
     * @type {Integer}
     */
    ReparsePointTag {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The file ID.
     * @type {FILE_ID_128}
     */
    FileId{
        get {
            if(!this.HasProp("__FileId"))
                this.__FileId := FILE_ID_128(72, this)
            return this.__FileId
        }
    }

    /**
     * The first character of the file name string. This is followed in memory by the remainder of the 
     *       string.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 88, 0, "UTF-16")
        set => StrPut(value, this.ptr + 88, 0, "UTF-16")
    }
}
