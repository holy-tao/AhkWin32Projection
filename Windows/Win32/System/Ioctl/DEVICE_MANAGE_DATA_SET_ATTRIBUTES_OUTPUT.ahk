#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Output structure for the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_manage_data_set_attributes_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_MANAGE_DATA_SET_ATTRIBUTES_OUTPUT extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Size of the structure. This is set to 
     *       <c>sizeof(DEVICE_MANAGE_DATA_SET_ATTRIBUTES_OUTPUT)</c>.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The action related to the instance of this structure. This is a value for the 
     *       <a href="https://docs.microsoft.com/windows/desktop/DevIO/device-data-management-set-action">DEVICE_DATA_MANAGEMENT_SET_ACTION</a> data
     *       type.
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
     * A notification action is performed. The <b>DeviceDsmActionFlag_NonDestructive</b> 
     *         (0x80000000) is a bit flag to indicate to the driver stack that this operation is non-destructive.
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
     * An offload read action is performed. The output described by the 
     *          <b>OutputBlockOffset</b> and <b>OutputBlockLength</b> members is a 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_offload_read_output">STORAGE_OFFLOAD_READ_OUTPUT</a> structure. 
     *          The <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000000) is a bit flag to indicate to 
     *          the driver stack that this operation is non-destructive.
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
     * An offload write action is performed. The output described by the 
     *          <b>OutputBlockOffset</b> and <b>OutputBlockLength</b> members is a 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_offload_write_output">STORAGE_OFFLOAD_WRITE_OUTPUT</a> structure.
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
     * An allocation bitmap is returned for the first data set range passed in. The output is in a 
     *          <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_data_set_lb_provisioning_state">DEVICE_DATA_SET_LB_PROVISIONING_STATE</a> 
     *          structure. The <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000000) is a bit flag to 
     *          indicate to the driver stack that this operation is non-destructive.
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
     * A repair action is performed. The <b>DeviceDsmActionFlag_NonDestructive</b> (0x80000000) 
     *          is a bit flag to indicate to the driver stack that this operation is non-destructive.
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
     * Not used.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    OperationStatus {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Extended error information.
     * @type {Integer}
     */
    ExtendedError {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Target specific error.
     * @type {Integer}
     */
    TargetDetailedError {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ReservedStatus {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The offset, in bytes, from the beginning of this structure to where any action-specific data is 
     *       located.
     * @type {Integer}
     */
    OutputBlockOffset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The length, in bytes, of the action-specific data.
     * @type {Integer}
     */
    OutputBlockLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
