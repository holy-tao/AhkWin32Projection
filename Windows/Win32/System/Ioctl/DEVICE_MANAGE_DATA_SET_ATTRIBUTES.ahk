#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Input structure for the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @remarks
 * The total length of the buffer that contains this structure must be at least 
 *     <c>(sizeof(DEVICE_MANAGE_DATA_SET_ATTRIBUTES) + ParameterBlockLength + DataSetRangesLength)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_manage_data_set_attributes
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_MANAGE_DATA_SET_ATTRIBUTES extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Size of this data structure. Must be set to 
     *       <c>sizeof(DEVICE_MANAGE_DATA_SET_ATTRIBUTES)</c>.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A valid value of type 
     *       <a href="https://docs.microsoft.com/windows/desktop/DevIO/device-data-management-set-action">DEVICE_DATA_MANAGEMENT_SET_ACTION</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DeviceDsmAction_Trim"></a><a id="devicedsmaction_trim"></a><a id="DEVICEDSMACTION_TRIM"></a><dl>
     * <dt><b>DeviceDsmAction_Trim</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A trim action is performed. This value is not supported for user-mode applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DeviceDsmAction_Notification"></a><a id="devicedsmaction_notification"></a><a id="DEVICEDSMACTION_NOTIFICATION"></a><dl>
     * <dt><b>DeviceDsmAction_Notification</b></dt>
     * <dt>2 | <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000002)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A notification action is performed. The additional parameters are in a 
     *         <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_dsm_notification_parameters">DEVICE_DSM_NOTIFICATION_PARAMETERS</a> 
     *         structure. The <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000000) is a bit flag to 
     *         indicate to the driver stack that this operation is non-destructive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DeviceDsmAction_OffloadRead"></a><a id="devicedsmaction_offloadread"></a><a id="DEVICEDSMACTION_OFFLOADREAD"></a><dl>
     * <dt><b>DeviceDsmAction_OffloadRead</b></dt>
     * <dt>3 | <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000003)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An offload read action is performed. The additional parameters are in a 
     *          <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_dsm_offload_read_parameters">DEVICE_DSM_OFFLOAD_READ_PARAMETERS</a> 
     *          structure. The <b>DeviceDsmActionFlag_NonDestructive</b> 
     *          (0x80000000) is a bit flag to indicate to the driver stack that this operation is non-destructive.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DeviceDsmAction_OffloadWrite"></a><a id="devicedsmaction_offloadwrite"></a><a id="DEVICEDSMACTION_OFFLOADWRITE"></a><dl>
     * <dt><b>DeviceDsmAction_OffloadWrite</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An offload write action is performed. The additional parameters are in a 
     *          <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_dsm_offload_write_parameters">DEVICE_DSM_OFFLOAD_WRITE_PARAMETERS</a> 
     *          structure.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DeviceDsmAction_Allocation"></a><a id="devicedsmaction_allocation"></a><a id="DEVICEDSMACTION_ALLOCATION"></a><dl>
     * <dt><b>DeviceDsmAction_Allocation</b></dt>
     * <dt>5 | <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000005)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An allocation bitmap is retrieved for the first data set range specified. The 
     *          <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000000) is a bit flag to indicate to the 
     *          driver stack that this operation is non-destructive.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DeviceDsmAction_Repair"></a><a id="devicedsmaction_repair"></a><a id="DEVICEDSMACTION_REPAIR"></a><dl>
     * <dt><b>DeviceDsmAction_Repair</b></dt>
     * <dt>6 | <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000006)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A repair action is performed. The additional parameters are in a 
     *          <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_data_set_repair_parameters">DEVICE_DATA_SET_REPAIR_PARAMETERS</a> 
     *          structure. The <b>DeviceDsmActionFlag_NonDestructive</b> 
     *          (0x80000000) is a bit flag to indicate to the driver stack that this operation is non-destructive.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DeviceDsmAction_Scrub"></a><a id="devicedsmaction_scrub"></a><a id="DEVICEDSMACTION_SCRUB"></a><dl>
     * <dt><b>DeviceDsmAction_Scrub</b></dt>
     * <dt>7 | <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000007)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A scrub action is performed. The <b>DeviceDsmActionFlag_NonDestructive</b> 
     *          (0x80000000) is a bit flag to indicate to the driver stack that this operation is non-destructive.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DeviceDsmAction_Resiliency"></a><a id="devicedsmaction_resiliency"></a><a id="DEVICEDSMACTION_RESILIENCY"></a><dl>
     * <dt><b>DeviceDsmAction_Resiliency</b></dt>
     * <dt>8 | <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000008)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resiliency action is performed. The <b>DeviceDsmActionFlag_NonDestructive</b> 
     *          (0x80000000) is a bit flag to indicate to the driver stack that this operation is non-destructive.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Action {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Flags for the actions.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICE_DSM_FLAG_TRIM_NOT_FS_ALLOCATED"></a><a id="device_dsm_flag_trim_not_fs_allocated"></a><dl>
     * <dt><b>DEVICE_DSM_FLAG_TRIM_NOT_FS_ALLOCATED</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set then the described ranges are not allocated by a file system. This flag is specific to the 
     *         <b>DeviceDsmAction_Trim</b> action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICE_DSM_FLAG_RESILIENCY_START_RESYNC"></a><a id="device_dsm_flag_resiliency_start_resync"></a><dl>
     * <dt><b>DEVICE_DSM_FLAG_RESILIENCY_START_RESYNC</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Starts a resync operation on the storage device. This flag is specific to the 
     *         <b>DeviceDsmAction_Resiliency</b> action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICE_DSM_FLAG_RESILIENCY_START_LOAD_BALANCING"></a><a id="device_dsm_flag_resiliency_start_load_balancing"></a><dl>
     * <dt><b>DEVICE_DSM_FLAG_RESILIENCY_START_LOAD_BALANCING</b></dt>
     * <dt>0x20000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Starts a load balancing operation on the storage device. This flag is specific to the 
     *         <b>DeviceDsmAction_Resiliency</b> action.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Byte offset to the start of the parameter block stored in the buffer contiguous to this structure. Must be 
     *       aligned to the corresponding structure alignment. A value of zero indicates there is no parameter block and the 
     *       <b>ParameterBlockLength</b> member must also be zero.
     * @type {Integer}
     */
    ParameterBlockOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Length of the parameter block, in bytes. A value of zero indicates there is no parameter block and the 
     *       <b>ParameterBlockOffset</b> member must also be zero.
     * @type {Integer}
     */
    ParameterBlockLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Byte offset to the start of the data set ranges block made up of an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-device_data_set_range">DEVICE_DATA_SET_RANGE</a> structures stored in the 
     *       buffer contiguous to this structure. Must be aligned to the 
     *       <b>DEVICE_DATA_SET_RANGE</b> structure alignment. A 
     *       value of zero indicates there is no data set ranges block and the 
     *       <b>DataSetRangesLength</b> member must also be zero.
     * @type {Integer}
     */
    DataSetRangesOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Length of the data set ranges block, in bytes. A value of zero indicates there is no data set ranges block 
     *       and the <b>DataSetRangesOffset</b> member must also be zero.
     * @type {Integer}
     */
    DataSetRangesLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
