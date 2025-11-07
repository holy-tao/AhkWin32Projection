#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ACTION_HEADER structure contains information about an action. This action is an extension to the standard transport interface.
 * @remarks
 * 
 * The scope of the action is determined by the <b>ncb_lsn</b> and <b>ncb_num</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure, as follows.
 * 
 * <table>
 * <tr>
 * <th></th>
 * <th>ncb_lsn = 0</th>
 * <th>ncb_lsn != 0</th>
 * </tr>
 * <tr>
 * <td>ncb_num = 0</td>
 * <td>Action applies to control channel associated with the valid LAN adapter. </td>
 * <td>Action applies to connection identifier associated with the valid local session number. </td>
 * </tr>
 * <tr>
 * <td>ncb_num != 0</td>
 * <td>Action applies to address associated with the valid LAN adapter.</td>
 * <td>Illegal combination. </td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//nb30/ns-nb30-action_header
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class ACTION_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the transport provider. This member can be used to check the validity of the request by the transport.
     * 
     * This member is always a four-character string. All strings starting with the letter M are reserved, as shown in the following example.
     * @type {Integer}
     */
    transport_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the action.
     * @type {Integer}
     */
    action_code {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
