#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used to mark a specified file or directory, and its update sequence number (USN) change journal record with data about changes.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-mark_handle_info32
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class MARK_HANDLE_INFO32 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

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
     *         volume handle, see the Remarks section.
     * 
     * This handle is required to check the privileges for this operation.
     * 
     * The caller must have the <b>SE_MANAGE_VOLUME_NAME</b> privilege. For more information, 
     *         see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">Privileges</a>.
     * @type {Integer}
     */
    VolumeHandle {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The flag that specifies additional information about the file or directory identified by the handle value 
     *        in the <b>VolumeHandle</b> member.
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MARK_HANDLE_REALTIME"></a><a id="mark_handle_realtime"></a><dl>
     * <dt><b>MARK_HANDLE_REALTIME</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is marked for real-time read behavior regardless of the actual file type. Files marked with 
     *          this flag must be opened for <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-buffering">unbuffered I/O</a>.
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
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    HandleInfo {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
