#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Defines an attribute set on the DHCP server.
 * @remarks
 * A DHCP server attribute is a value that can be queried to determine supported and available features.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_attrib
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_ATTRIB {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_ATTRIB_ID</a> structure that uniquely identifies the DHCP server attribute.
     */
    DhcpAttribId : UInt32

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
     */
    DhcpAttribType : UInt32

    DhcpAttribBool : BOOL

    static __New() {
        DefineProp(this.Prototype, 'DhcpAttribUlong', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
