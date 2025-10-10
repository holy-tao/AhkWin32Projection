#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the DeviceDsmAction_Notification action for the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_dsm_notification_parameters
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DSM_NOTIFICATION_PARAMETERS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the total size, in bytes, of this structure. The value of this member must include the total 
     *       size, in bytes, of the <b>FileTypeIDs</b> member.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags specific to the notify operation
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICE_DSM_NOTIFY_FLAG_BEGIN"></a><a id="device_dsm_notify_flag_begin"></a><dl>
     * <dt><b>DEVICE_DSM_NOTIFY_FLAG_BEGIN</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ranges specified in the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-device_data_set_range">DEVICE_DATA_SET_RANGE</a> structures following the 
     *         <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_manage_data_set_attributes">DEVICE_MANAGE_DATA_SET_ATTRIBUTES</a> 
     *         structure are currently being used by the file types that are specified in the 
     *         <b>FileTypeIDs</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICE_DSM_NOTIFY_FLAG_END"></a><a id="device_dsm_notify_flag_end"></a><dl>
     * <dt><b>DEVICE_DSM_NOTIFY_FLAG_END</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ranges are no longer being used by the file types that are specified in the 
     *         <b>FileTypeIDs</b> member.
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
     * The number of entries in the <b>FileTypeIDs</b> member.
     * @type {Integer}
     */
    NumFileTypeIDs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * One or more <b>GUID</b> values that specify the file type for the notification 
     *        operation.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_TYPE_NOTIFICATION_GUID_PAGE_FILE"></a><a id="file_type_notification_guid_page_file"></a><dl>
     * <dt><b>FILE_TYPE_NOTIFICATION_GUID_PAGE_FILE</b></dt>
     * <dt>0d0a64a1-38fc-4db8-9fe7-3f4352cd7c5c</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a notification operation for a page file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_TYPE_NOTIFICATION_GUID_HIBERNATION_FILE"></a><a id="file_type_notification_guid_hibernation_file"></a><dl>
     * <dt><b>FILE_TYPE_NOTIFICATION_GUID_HIBERNATION_FILE</b></dt>
     * <dt>b7624d64-b9a3-4cf8-8011-5b86c940e7b7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a notification operation for the system hibernation file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_TYPE_NOTIFICATION_GUID_CRASHDUMP_FILE"></a><a id="file_type_notification_guid_crashdump_file"></a><dl>
     * <dt><b>FILE_TYPE_NOTIFICATION_GUID_CRASHDUMP_FILE</b></dt>
     * <dt>9d453eb7-d2a6-4dbd-a2e3-fbd0ed9109a9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a notification operation for a system crash dump file.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Array<Guid>}
     */
    FileTypeID{
        get {
            if(!this.HasProp("__FileTypeIDProxyArray"))
                this.__FileTypeIDProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "ptr")
            return this.__FileTypeIDProxyArray
        }
    }
}
