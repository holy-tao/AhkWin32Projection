#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_OFFLOAD_TOKEN.ahk" { STORAGE_OFFLOAD_TOKEN }

/**
 * Output structure for the DeviceDsmAction_OffloadRead action of the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_offload_read_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_OFFLOAD_READ_OUTPUT {
    #StructPack 8

    /**
     * Output flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STORAGE_OFFLOAD_READ_RANGE_TRUNCATED"></a><a id="storage_offload_read_range_truncated"></a><dl>
     * <dt><b>STORAGE_OFFLOAD_READ_RANGE_TRUNCATED</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ranges represented by the token is smaller than the ranges specified in the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-device_data_set_range">DEVICE_DATA_SET_RANGE</a> structures passed in the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_manage_data_set_attributes">IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES</a> 
     *         control code input buffer. In other words the <b>LengthProtected</b> member is less than 
     *         the sum of all of the <b>LengthInBytes</b> members of the 
     *         <b>DEVICE_DATA_SET_RANGE</b> structures passed.
     * 
     * </td>
     * </tr>
     * </table>
     */
    OffloadReadFlags : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * The total length of the snapshot represented by the token.
     */
    LengthProtected : Int64

    /**
     * Length of the token in bytes.
     */
    TokenLength : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_offload_token">STORAGE_OFFLOAD_TOKEN</a> containing the 
     *       token created.
     */
    Token : STORAGE_OFFLOAD_TOKEN

}
