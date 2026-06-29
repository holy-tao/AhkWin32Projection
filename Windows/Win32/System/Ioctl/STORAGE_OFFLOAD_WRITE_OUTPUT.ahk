#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Output structure for the DeviceDsmAction_OffloadWrite action of the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_offload_write_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_OFFLOAD_WRITE_OUTPUT {
    #StructPack 8

    /**
     * Out flags
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STORAGE_OFFLOAD_WRITE_RANGE_TRUNCATED"></a><a id="storage_offload_write_range_truncated"></a><dl>
     * <dt><b>STORAGE_OFFLOAD_WRITE_RANGE_TRUNCATED</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The range written is less than the range specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STORAGE_OFFLOAD_TOKEN_INVALID"></a><a id="storage_offload_token_invalid"></a><dl>
     * <dt><b>STORAGE_OFFLOAD_TOKEN_INVALID</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The token specified is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    OffloadWriteFlags : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * The length of the copied content.
     */
    LengthCopied : Int64

}
