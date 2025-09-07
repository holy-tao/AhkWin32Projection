#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used to mark a specified file or directory, and its update sequence number (USN) change journal record with data about changes.
 * @remarks
 * To retrieve a handle to a volume, call 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> with the 
  *      <i>lpFileName</i> parameter set to a string in the following form:
  * 
  * "\\.&#92;<i>X</i>:"
  * 
  * In the preceding string, <i>X</i> is the letter identifying the drive on which the volume 
  *      appears.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-mark_handle_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class MARK_HANDLE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    UsnSourceInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CopyNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The volume handle to the volume where the file or directory resides. For more information on obtaining a 
     *        volume handle, see the Remarks section.
     * 
     * This handle is required to check the privileges for this operation.
     * 
     * The caller must have the <b>SE_MANAGE_VOLUME_NAME</b> privilege. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">Privileges</a>.
     * @type {Pointer<Ptr>}
     */
    VolumeHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The flag that specifies additional information about the file or directory identified by the handle value 
     *       in the <b>VolumeHandle</b> member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_PROTECT_CLUSTERS"></a><a id="mark_handle_protect_clusters"></a><dl>
     * <dt><b>MARK_HANDLE_PROTECT_CLUSTERS</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is marked as unable to be defragmented until the handle is closed.
     * 
     * Once a handle marked <b>MARK_HANDLE_PROTECT_CLUSTERS</b> is closed, there is no guarantee that the file's clusters won't move.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_TXF_SYSTEM_LOG"></a><a id="mark_handle_txf_system_log"></a><dl>
     * <dt><b>MARK_HANDLE_TXF_SYSTEM_LOG</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is marked as unable to be defragmented until the handle is closed.
     * 
     * <b>Windows Server 2003:  </b>This flag is not supported until Windows Server 2003 with SP1.
     * 
     * <b>Windows XP:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_NOT_TXF_SYSTEM_LOG"></a><a id="mark_handle_not_txf_system_log"></a><dl>
     * <dt><b>MARK_HANDLE_NOT_TXF_SYSTEM_LOG</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is marked as unable to be defragmented until the handle is closed.
     * 
     * <b>Windows Server 2003:  </b>This flag is not supported until Windows Server 2003 with SP1.
     * 
     * <b>Windows XP:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_REALTIME"></a><a id="mark_handle_realtime"></a><dl>
     * <dt><b>MARK_HANDLE_REALTIME</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is marked for real-time read behavior regardless of the actual file type. Files marked with this 
     *          flag must be opened for <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-buffering">unbuffered I/O</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_NOT_REALTIME"></a><a id="mark_handle_not_realtime"></a><dl>
     * <dt><b>MARK_HANDLE_NOT_REALTIME</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file previously marked for real-time read behavior using the 
     *          <b>MARK_HANDLE_REALTIME</b> flag can be unmarked using this flag, removing the real-time 
     *          behavior. Files marked with this flag must be opened for 
     *          <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-buffering">unbuffered I/O</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_READ_COPY"></a><a id="mark_handle_read_copy"></a><dl>
     * <dt><b>MARK_HANDLE_READ_COPY</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the copy number specified in the <b>CopyNumber</b> member should be used 
     *          for reads. Files marked with this flag must be opened for 
     *          <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-buffering">unbuffered I/O</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This flag is not supported until Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_NOT_READ_COPY"></a><a id="mark_handle_not_read_copy"></a><dl>
     * <dt><b>MARK_HANDLE_NOT_READ_COPY</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file previously marked for read-copy behavior using the 
     *         <b>MARK_HANDLE_READ_COPY</b> flag can be unmarked using this flag, removing the read-copy 
     *         behavior. Files marked with this flag must be opened for 
     *         <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-buffering">unbuffered I/O</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This flag is not supported until Windows 8 and Windows Server 2012.
     * </td>
     * </tr>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_RETURN_PURGE_FAILURE"></a><a id="mark_handle_return_purge_failure"></a><dl>
     * <dt><b>MARK_HANDLE_RETURN_PURGE_FAILURE</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When intermixing memory mapped/cached IO with non-cached IO the system attempts, when a non-cached io is issued, 
     *   to purge memory mappings for the range of the non-cached IO.  If these purges fail 
     *   the system normally does not return the failure to the caller which can lead to corrupted state 
     *   (which is why the documentation says to not do this). This flag tells the system to return purge failures 
     *   for the given handle so the application can better handle this situation
     * 
     * 
     * This flag is not supported until Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_DISABLE_FILE_METADATA_OPTIMIZATION"></a><a id="mark_handle_disable_file_metadata_optimization"></a><dl>
     * <dt><b>MARK_HANDLE_DISABLE_FILE_METADATA_OPTIMIZATION </b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A highly fragmented file in NTFS uses multiple MFT records to describe all of the extents for a file. This 
     * list of child MFT records (also known as FRS records) are controlled by a structure known as an attribute list. An 
     * attribute list is limited to 128K in size. When the size of an attribute list hits a certain threshold NTFS will 
     * trigger a background compaction on the extents so the minimum number of child FRS records will be used. 
     * This flag disables this FRS compaction feature for the given file.
     * 
     * This flag is not supported until Windows 10.
     * 
     * </td>
     * </tr>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_ENABLE_USN_SOURCE_ON_PAGING_IO      "></a><a id="mark_handle_enable_usn_source_on_paging_io"></a><dl>
     * <dt><b>MARK_HANDLE_ENABLE_USN_SOURCE_ON_PAGING_IO      </b></dt>
     * <dt>0x00002000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tells NTFS to set the given UsnSourceInfo value on Paging writes in the USN Journal. Traditionally this was not
     * done on paging writes since the system did not know what thread made the given changes. This is an override. This only works if the FileObject the memory manager is 
     * using has this state associated with it.
     * 
     * 
     * This flag is not supported until Windows 10.
     * 
     * </td>
     * </tr>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_SKIP_COHERENCY_SYNC_DISALLOW_WRITES"></a><a id="mark_handle_skip_coherency_sync_disallow_writes"></a><dl>
     * <dt><b>MARK_HANDLE_SKIP_COHERENCY_SYNC_DISALLOW_WRITES</b></dt>
     * <dt>0x00004000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Setting this flag tells the system that writes are not allowed on this file.  If an application tries 
     * to open the file for write access, the operation is failed with STATUS_ACCESS_DENIED. 
     * If a write is seen the operation is failed with STATUS_MARKED_TO_DISALLOW_WRITES
     * 
     * 
     * This flag is not supported until Windows 10.
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    HandleInfo {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
