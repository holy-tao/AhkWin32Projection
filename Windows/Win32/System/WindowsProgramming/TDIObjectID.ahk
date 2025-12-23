#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TDIEntityID.ahk

/**
 * Contains a part of the TCP_REQUEST_QUERY_INFORMATION_EX structure that is used with the IOCTL_TCP_QUERY_INFORMATION_EX control code to specify the kind of information being requested from the TCP driver.
 * @see https://learn.microsoft.com/windows/win32/api/tdiinfo/ns-tdiinfo-tdiobjectid
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class TDIObjectID extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * This is a <a href="https://docs.microsoft.com/windows/desktop/api/tdiinfo/ns-tdiinfo-tdientityid">TDIEntityID</a> structure.
     * @type {TDIEntityID}
     */
    toi_entity{
        get {
            if(!this.HasProp("__toi_entity"))
                this.__toi_entity := TDIEntityID(0, this)
            return this.__toi_entity
        }
    }

    /**
     * The kind of information being requested. The value can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INFO_CLASS_GENERIC"></a><a id="info_class_generic"></a><dl>
     * <dt><b>INFO_CLASS_GENERIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used when requesting an enumeration of all TDI entities on the current machine, or when determining the type of one of those TDI entities.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INFO_CLASS_PROTOCOL"></a><a id="info_class_protocol"></a><dl>
     * <dt><b>INFO_CLASS_PROTOCOL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used when requesting information about a specific interface or IP entity.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    toi_class {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The type of object being queried. The value can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INFO_TYPE_PROVIDER"></a><a id="info_type_provider"></a><dl>
     * <dt><b>INFO_TYPE_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A service provider. All queries described in the <a href="https://docs.microsoft.com/windows/desktop/api/tcpioctl/ni-tcpioctl-ioctl_tcp_query_information_ex">IOCTL_TCP_QUERY_INFORMATION_EX</a> topic use this type value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INFO_TYPE_ADDRESS_OBJECT"></a><a id="info_type_address_object"></a><dl>
     * <dt><b>INFO_TYPE_ADDRESS_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An address object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INFO_TYPE_CONNECTION"></a><a id="info_type_connection"></a><dl>
     * <dt><b>INFO_TYPE_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A connection object.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    toi_type {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * If <b>toi_class</b> is <b>INFO_CLASS_GENERIC</b>, <b>toi_id</b> can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENTITY_LIST_ID"></a><a id="entity_list_id"></a><dl>
     * <dt><b>ENTITY_LIST_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query returns a list of all TDI entities on the local machine.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENTITY_TYPE_ID"></a><a id="entity_type_id"></a><dl>
     * <dt><b>ENTITY_TYPE_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query returns a type value for a specified TDI entity.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <b>toi_class</b> is <b>INFO_CLASS_PROTOCOL</b>, <b>toi_id</b> can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IF_MIB_STATS_ID"></a><a id="if_mib_stats_id"></a><dl>
     * <dt><b>IF_MIB_STATS_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the entity being queried is an interface supporting MIB-II, causes the query to return an <a href="https://docs.microsoft.com/windows/desktop/api/tcpioctl/ns-tcpioctl-ifentry">IFEntry</a> structure that contains information about the interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IP_MIB_STATS_ID"></a><a id="ip_mib_stats_id"></a><dl>
     * <dt><b>IP_MIB_STATS_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the entity being queried is a network-layer IP entity, causes the query to return an <a href="https://docs.microsoft.com/windows/desktop/api/tcpioctl/ns-tcpioctl-ipsnmpinfo">IPSNMPInfo</a> structure that contains information about the entity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IP_MIB_ADDRTABLE_ENTRY_ID"></a><a id="ip_mib_addrtable_entry_id"></a><dl>
     * <dt><b>IP_MIB_ADDRTABLE_ENTRY_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the entity being queried is a network-layer IP entity on which one or more IP addresses are active, causes the query to return an array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpioctl/ns-tcpioctl-ipaddrentry">IPAddrEntry</a> structures that contain information about those addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IP_INTFC_INFO_ID"></a><a id="ip_intfc_info_id"></a><dl>
     * <dt><b>IP_INTFC_INFO_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes an <a href="https://docs.microsoft.com/windows/desktop/api/tcpioctl/ns-tcpioctl-ipinterfaceinfo">IPInterfaceInfo</a> structure to be returned with information about a specific IP address specified in the <b>Context</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdiinfo/ns-tdiinfo-tcp_request_query_information_ex_w2k">TCP_REQUEST_QUERY_INFORMATION_EX</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    toi_id {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
