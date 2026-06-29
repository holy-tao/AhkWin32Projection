#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_BINARY_DATA structure defines an opaque blob of binary data.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_BINARY_DATA {
    #StructPack 8

    /**
     * Specifies the size of <b>Data</b>, in bytes.
     */
    DataLength : UInt32

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
     */
    Data : IntPtr

}
