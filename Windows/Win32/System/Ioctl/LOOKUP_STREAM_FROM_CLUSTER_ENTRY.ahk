#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Returned from the FSCTL_LOOKUP_STREAM_FROM_CLUSTER control code.
 * @remarks
 * The name in the <b>FileName</b> member can be very long and in a format not recognized by 
 *     a customer with the stream name and attribute type name following the filename. While it's appropriate to log the 
 *     entire filename for diagnostic purposes, if it is to be presented to an end-user it should be reformatted to be 
 *     more understandable (for example, remove the attribute type name and if the <b>Flags</b> 
 *     member has any flag other than <b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_DATA</b> set then 
 *     an appropriate message should be displayed.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-lookup_stream_from_cluster_entry
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class LOOKUP_STREAM_FROM_CLUSTER_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Offset in bytes from the beginning of this structure to the next 
     *       <b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY</b> 
     *       structure returned. If there are no more entries, this value is zero.
     * @type {Integer}
     */
    OffsetToNext {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags describing characteristics about this stream. The value will consist of one or more of these values. 
     *       At least one of the <b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_*</b> values that fall 
     *       within the <b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_MASK</b> (0xff000000) will be set; 
     *       one or more of the other flag values may be set.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_PAGE_FILE"></a><a id="lookup_stream_from_cluster_entry_flag_page_file"></a><dl>
     * <dt><b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_PAGE_FILE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is part of the system pagefile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_DENY_DEFRAG_SET"></a><a id="lookup_stream_from_cluster_entry_flag_deny_defrag_set"></a><dl>
     * <dt><b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_DENY_DEFRAG_SET</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is locked from defragmentation. The <b>HandleInfo</b> member of the [MARK_HANDLE_INFO structure](ns-winioctl-mark_handle_info.md) for this stream has the <b>MARK_HANDLE_PROTECT_CLUSTERS</b> flag set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_FS_SYSTEM_FILE"></a><a id="lookup_stream_from_cluster_entry_flag_fs_system_file"></a><dl>
     * <dt><b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_FS_SYSTEM_FILE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is part of a file that is internal to the filesystem.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_TXF_SYSTEM_FILE"></a><a id="lookup_stream_from_cluster_entry_flag_txf_system_file"></a><dl>
     * <dt><b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_TXF_SYSTEM_FILE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is part of a file that is internal to TxF.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_DATA"></a><a id="lookup_stream_from_cluster_entry_attribute_data"></a><dl>
     * <dt><b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_DATA</b></dt>
     * <dt>0x01000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is part of a $DATA attribute for the file (data stream).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_INDEX"></a><a id="lookup_stream_from_cluster_entry_attribute_index"></a><dl>
     * <dt><b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_INDEX</b></dt>
     * <dt>0x02000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is part of the $INDEX_ALLOCATION attribute for the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_SYSTEM"></a><a id="lookup_stream_from_cluster_entry_attribute_system"></a><dl>
     * <dt><b>LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_SYSTEM</b></dt>
     * <dt>0x03000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is part of another attribute for the file.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This value is reserved and is currently zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * This is the cluster that this entry refers to. It will be one of the clusters passed in the input 
     *       structure.
     * @type {Integer}
     */
    Cluster {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * A <b>NULL</b>-terminated Unicode string containing the path of the object relative to 
     *       the root of the volume. This string will refer to the attribute or stream represented by the cluster. This 
     *       string is not limited by <b>MAX_PATH</b> and may be up to 32,768 characters (65,536 bytes) in 
     *       length. Not all of the filenames returned can be opened; some are internal to NTFS and always opened 
     *       exclusively. The string returned includes the full path including filename, stream name, and attribute type name 
     *       in the form 
     *       "<i>full</i>&#92;<i>path</i>&#92;<i>to</i>&#92;<i>file</i>&#92;<i>filename.ext</i>:<i>streamname</i>:<i>typename</i>".
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 24, 0, "UTF-16")
        set => StrPut(value, this.ptr + 24, 0, "UTF-16")
    }
}
