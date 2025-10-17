#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an attribute set on the DHCP server.
 * @remarks
 * 
  * A DHCP server attribute is a value that can be queried to determine supported and available features.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_attrib
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_ATTRIB extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_ATTRIB_ID</a> structure that uniquely identifies the DHCP server attribute.
     * @type {Integer}
     */
    DhcpAttribId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies exactly one of the following attribute types.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ATTRIB_BOOL_IS_ROGUE"></a><a id="dhcp_attrib_bool_is_rogue"></a><dl>
     * <dt><b>DHCP_ATTRIB_BOOL_IS_ROGUE</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCP server is rogue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ATTRIB_BOOL_IS_DYNBOOTP"></a><a id="dhcp_attrib_bool_is_dynbootp"></a><dl>
     * <dt><b>DHCP_ATTRIB_BOOL_IS_DYNBOOTP</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCP server supports BOOTP for dynamic address service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ATTRIB_BOOL_IS_PART_OF_DSDC"></a><a id="dhcp_attrib_bool_is_part_of_dsdc"></a><dl>
     * <dt><b>DHCP_ATTRIB_BOOL_IS_PART_OF_DSDC</b></dt>
     * <dt>0x03</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCP server is part of the directory service domain controller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ATTRIB_BOOL_IS_BINDING_AWARE"></a><a id="dhcp_attrib_bool_is_binding_aware"></a><dl>
     * <dt><b>DHCP_ATTRIB_BOOL_IS_BINDING_AWARE</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCP server is binding aware.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ATTRIB_BOOL_IS_ADMIN"></a><a id="dhcp_attrib_bool_is_admin"></a><dl>
     * <dt><b>DHCP_ATTRIB_BOOL_IS_ADMIN</b></dt>
     * <dt>0x05</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCP server is the admin-level DHCP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ATTRIB_ULONG_RESTORE_STATUS"></a><a id="dhcp_attrib_ulong_restore_status"></a><dl>
     * <dt><b>DHCP_ATTRIB_ULONG_RESTORE_STATUS</b></dt>
     * <dt>0x06</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCP server can restore status with the provided attribute value.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DhcpAttribType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    DhcpAttribBool {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DhcpAttribUlong {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
