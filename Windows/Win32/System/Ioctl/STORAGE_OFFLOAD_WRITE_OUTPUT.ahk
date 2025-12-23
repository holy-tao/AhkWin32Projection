#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Output structure for the DeviceDsmAction_OffloadWrite action of the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_offload_write_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_OFFLOAD_WRITE_OUTPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
     * @type {Integer}
     */
    OffloadWriteFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The length of the copied content.
     * @type {Integer}
     */
    LengthCopied {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
