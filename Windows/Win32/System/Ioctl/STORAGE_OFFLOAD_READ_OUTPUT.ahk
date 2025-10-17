#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_OFFLOAD_TOKEN.ahk

/**
 * Output structure for the DeviceDsmAction_OffloadRead action of the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_offload_read_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_OFFLOAD_READ_OUTPUT extends Win32Struct
{
    static sizeof => 536

    static packingSize => 8

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
     * @type {Integer}
     */
    OffloadReadFlags {
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
     * The total length of the snapshot represented by the token.
     * @type {Integer}
     */
    LengthProtected {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Length of the token in bytes.
     * @type {Integer}
     */
    TokenLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_offload_token">STORAGE_OFFLOAD_TOKEN</a> containing the 
     *       token created.
     * @type {STORAGE_OFFLOAD_TOKEN}
     */
    Token{
        get {
            if(!this.HasProp("__Token"))
                this.__Token := STORAGE_OFFLOAD_TOKEN(24, this)
            return this.__Token
        }
    }
}
