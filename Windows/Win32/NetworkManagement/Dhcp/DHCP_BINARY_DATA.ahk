#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_BINARY_DATA structure defines an opaque blob of binary data.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_binary_data
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_BINARY_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the size of <b>Data</b>, in bytes.
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an opaque blob of byte (binary) data.
     * 
     * The data is formatted as follows:
     * 
     * <table>
     * <tr>
     * <th>Byte</th>
     * <th>Format</th>
     * </tr>
     * <tr>
     * <td>Byte 0 to byte 3 </td>
     * <td>The result of a binary AND on the IP address and the subnet mask in reverse order.</td>
     * </tr>
     * <tr>
     * <td>Byte 4</td>
     * <td>Hardware identifier. This value is always 0x01.</td>
     * </tr>
     * <tr>
     * <td>Byte 5 to Byte 10 </td>
     * <td>The MAC address of the client.</td>
     * </tr>
     * </table>
     * @type {Pointer<Integer>}
     */
    Data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
