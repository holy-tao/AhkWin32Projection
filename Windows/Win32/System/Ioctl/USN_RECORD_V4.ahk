#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USN_RECORD_COMMON_HEADER.ahk
#Include ..\..\Storage\FileSystem\FILE_ID_128.ahk
#Include .\USN_RECORD_EXTENT.ahk

/**
 * Contains the information for an update sequence number (USN) change journal version 4.0 record. The version 2.0 and 3.0 records are defined by the USN_RECORD_V2 (also called USN_RECORD) and USN_RECORD_V3 structures respectively.
 * @remarks
 * 
  * A <b>USN_RECORD_V4</b> record is only output when range tracking is turned on and the file size is equal or larger than the value of the <b>RangeTrackFileSizeThreshold</b> member. The user always receives one or more <b>USN_RECORD_V4</b> records followed by one <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-usn_record_v3">USN_RECORD_V3</a> record.
  * 
  * To provide a path forward compatibility in change journal clients, Microsoft provides a major and minor version number of the change journal software in the <b>USN_RECORD_V4</b> structure. Your code should examine these values, examine its own compatibility with the change journal software, and gracefully handle any incompatibility if necessary.
  * 
  * A change in the minor version number indicates that the existing <b>USN_RECORD_V4</b> structure members are still valid, but that new members may have been added between the penultimate member and the last, which is a variable-length string.
  * 
  * To handle such a change gracefully, your code should not do any compile-time pointer arithmetic that relies on the location of the last member. For example, a change in the minor version number makes the <c>sizeof(USN_RECORD)</c> call unreliable. Instead, rely on run-time calculations that use the <b>RecordLength</b> member.
  * 
  * An increase in the major version number of the change journal software indicates that the <b>USN_RECORD_V4</b> structure may have undergone major changes, and that the current definition may not be reliable. If your code detects a change in the major version number of the change journal software, the code should not work with the change journal.
  * 
  * 
  * For more information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/creating-modifying-and-deleting-a-change-journal">Creating, Modifying, and Deleting a Change Journal</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-usn_record_v4
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class USN_RECORD_V4 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-usn_record_common_header">USN_RECORD_COMMON_HEADER</a> structure that describes the record length, major version, and minor  version for the record.
     * @type {USN_RECORD_COMMON_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := USN_RECORD_COMMON_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * The 128-bit ordinal number of the file or directory for which this record notes changes.
     * 
     * This value  is an arbitrarily assigned value that associates a journal record with a file.
     * @type {FILE_ID_128}
     */
    FileReferenceNumber{
        get {
            if(!this.HasProp("__FileReferenceNumber"))
                this.__FileReferenceNumber := FILE_ID_128(8, this)
            return this.__FileReferenceNumber
        }
    }

    /**
     * The 128-bit ordinal number of the directory where the file or directory that is associated with this record 
     *        is located.
     * 
     * This value  is an arbitrarily assigned value that associates a journal record with a parent directory.
     * @type {FILE_ID_128}
     */
    ParentFileReferenceNumber{
        get {
            if(!this.HasProp("__ParentFileReferenceNumber"))
                this.__ParentFileReferenceNumber := FILE_ID_128(24, this)
            return this.__ParentFileReferenceNumber
        }
    }

    /**
     * The USN of this record.
     * @type {Integer}
     */
    Usn {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * The flags that identify reasons for changes that have accumulated in this file or directory journal record 
     *        since the file or directory opened.
     * 
     * When a file or directory closes, then a final USN record is generated with the 
     *        <b>USN_REASON_CLOSE</b> flag set. The next change (for example, after the next open 
     *        operation or deletion) starts a new record with a new set of reason flags.
     * 
     * A rename or move operation generates two USN records, one that records the old parent directory for the item, 
     *        and one that records a new parent.
     * 
     * The following  table identifies the possible flags.
     * 
     * <div class="alert"><b>Note</b>  Unused bits are reserved.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_BASIC_INFO_CHANGE"></a><a id="usn_reason_basic_info_change"></a><dl>
     * <dt><b>USN_REASON_BASIC_INFO_CHANGE</b></dt>
     * <dt>0x00008000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user has either changed one or more file or directory attributes (for example,  the read-only, hidden, 
     *         system, archive, or sparse attribute), or one or more time stamps.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_CLOSE"></a><a id="usn_reason_close"></a><dl>
     * <dt><b>USN_REASON_CLOSE</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_COMPRESSION_CHANGE"></a><a id="usn_reason_compression_change"></a><dl>
     * <dt><b>USN_REASON_COMPRESSION_CHANGE</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The compression state of the file or directory is changed from or to compressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_DATA_EXTEND"></a><a id="usn_reason_data_extend"></a><dl>
     * <dt><b>USN_REASON_DATA_EXTEND</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is extended (added to).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_DATA_OVERWRITE"></a><a id="usn_reason_data_overwrite"></a><dl>
     * <dt><b>USN_REASON_DATA_OVERWRITE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data in the file or directory is overwritten.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_DATA_TRUNCATION"></a><a id="usn_reason_data_truncation"></a><dl>
     * <dt><b>USN_REASON_DATA_TRUNCATION</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is truncated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_EA_CHANGE"></a><a id="usn_reason_ea_change"></a><dl>
     * <dt><b>USN_REASON_EA_CHANGE</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user made a change to the extended attributes of a file or directory.
     * 
     * These NTFS file system attributes are not accessible to Windows-based applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_ENCRYPTION_CHANGE"></a><a id="usn_reason_encryption_change"></a><dl>
     * <dt><b>USN_REASON_ENCRYPTION_CHANGE</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is encrypted or decrypted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_FILE_CREATE"></a><a id="usn_reason_file_create"></a><dl>
     * <dt><b>USN_REASON_FILE_CREATE</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is created for the first time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_FILE_DELETE"></a><a id="usn_reason_file_delete"></a><dl>
     * <dt><b>USN_REASON_FILE_DELETE</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_HARD_LINK_CHANGE"></a><a id="usn_reason_hard_link_change"></a><dl>
     * <dt><b>USN_REASON_HARD_LINK_CHANGE</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An NTFS file system hard link is added to or removed from the file or directory.
     * 
     * An NTFS file system hard link, similar to a POSIX hard link, is one of several directory entries that see 
     *          the same file or directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_INDEXABLE_CHANGE"></a><a id="usn_reason_indexable_change"></a><dl>
     * <dt><b>USN_REASON_INDEXABLE_CHANGE</b></dt>
     * <dt>0x00004000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user changes the <b>FILE_ATTRIBUTE_NOT_CONTENT_INDEXED</b> attribute.
     * 
     * That is, the user changes the file or directory from one where content can be indexed to one where content 
     *          cannot be indexed, or vice versa. Content indexing permits rapid searching of data by building a database of 
     *          selected content.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_INTEGRITY_CHANGE"></a><a id="usn_reason_integrity_change"></a><dl>
     * <dt><b>USN_REASON_INTEGRITY_CHANGE</b></dt>
     * <dt>0x00800000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user changed the state of the <b>FILE_ATTRIBUTE_INTEGRITY_STREAM</b> attribute for the given stream.
     * 
     * On the ReFS file system, integrity streams maintain a checksum of all data for that stream, so that the contents of the file can be validated during read or write operations.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_NAMED_DATA_EXTEND"></a><a id="usn_reason_named_data_extend"></a><dl>
     * <dt><b>USN_REASON_NAMED_DATA_EXTEND</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The one or more named data streams for a file are extended (added to).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_NAMED_DATA_OVERWRITE"></a><a id="usn_reason_named_data_overwrite"></a><dl>
     * <dt><b>USN_REASON_NAMED_DATA_OVERWRITE</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data in one or more named data streams for a file is overwritten.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_NAMED_DATA_TRUNCATION"></a><a id="usn_reason_named_data_truncation"></a><dl>
     * <dt><b>USN_REASON_NAMED_DATA_TRUNCATION</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The one or more named data streams for a file is truncated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_OBJECT_ID_CHANGE"></a><a id="usn_reason_object_id_change"></a><dl>
     * <dt><b>USN_REASON_OBJECT_ID_CHANGE</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object identifier of a file or directory is changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_RENAME_NEW_NAME"></a><a id="usn_reason_rename_new_name"></a><dl>
     * <dt><b>USN_REASON_RENAME_NEW_NAME</b></dt>
     * <dt>0x00002000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file or directory is renamed, and the file name in the 
     *         <b>USN_RECORD_V4</b> structure is the new name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_RENAME_OLD_NAME"></a><a id="usn_reason_rename_old_name"></a><dl>
     * <dt><b>USN_REASON_RENAME_OLD_NAME</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is renamed, and the file name in the 
     *         <b>USN_RECORD_V4</b> structure is the previous name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_REPARSE_POINT_CHANGE"></a><a id="usn_reason_reparse_point_change"></a><dl>
     * <dt><b>USN_REASON_REPARSE_POINT_CHANGE</b></dt>
     * <dt>0x00100000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reparse point that is contained in a file or directory is changed, or a reparse point is added to or 
     *         deleted from a file or directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_SECURITY_CHANGE"></a><a id="usn_reason_security_change"></a><dl>
     * <dt><b>USN_REASON_SECURITY_CHANGE</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A change is made in the access rights to a file or directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_STREAM_CHANGE"></a><a id="usn_reason_stream_change"></a><dl>
     * <dt><b>USN_REASON_STREAM_CHANGE</b></dt>
     * <dt>0x00200000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A named stream is added to or removed from a file, or a named stream is renamed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USN_REASON_TRANSACTED_CHANGE"></a><a id="usn_reason_transacted_change"></a><dl>
     * <dt><b>USN_REASON_TRANSACTED_CHANGE</b></dt>
     * <dt>0x00400000 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The given stream is modified through a committed TxF transaction.  
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Reason {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Additional information about the source of the change, set by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_mark_handle">FSCTL_MARK_HANDLE</a> of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a> operation.
     * 
     * When a thread writes a new USN record, the source information flags in the prior record continue to be 
     *        present only if the thread also sets those flags.  Therefore, the source information structure allows 
     *        applications to filter out USN records that are set only by a known source, for example, an antivirus filter.
     * @type {Integer}
     */
    SourceInfo {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The number of extents that remain after the current <b>USN_RECORD_V4</b> record.  Multiple version 4.0  records may be required to describe all of the modified extents for a given file.  When the <b>RemainingExtents</b> member is  0,  the current <b>USN_RECORD_V4</b> record is the last <b>USN_RECORD_V4</b> record for the file.  The last <b>USN_RECORD_V4</b> entry for a given file is always  followed by a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-usn_record_v3">USN_RECORD_V3</a> record with at least the <b>USN_REASON_CLOSE</b> flag set.
     * @type {Integer}
     */
    RemainingExtents {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The number of extents in current <b>USN_RECORD_V4</b> entry.
     * @type {Integer}
     */
    NumberOfExtents {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * The size of each <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-usn_record_extent">USN_RECORD_EXTENT</a> structure in the <b>Extents</b> member, in bytes.
     * @type {Integer}
     */
    ExtentSize {
        get => NumGet(this, 62, "ushort")
        set => NumPut("ushort", value, this, 62)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-usn_record_extent">USN_RECORD_EXTENT</a> structures that represent the extents in the <b>USN_RECORD_V4</b> entry.
     * @type {Array<USN_RECORD_EXTENT>}
     */
    Extents{
        get {
            if(!this.HasProp("__ExtentsProxyArray"))
                this.__ExtentsProxyArray := Win32FixedArray(this.ptr + 64, 1, USN_RECORD_EXTENT, "")
            return this.__ExtentsProxyArray
        }
    }
}
