#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a network-service type value. This information may be specific to a namespace.
 * @remarks
 * 
  * When you use the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/nf-nspapi-setservicea">SetService</a> function to add a network service type to a namespace, a 
  * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_type_info_absa">SERVICE_TYPE_INFO_ABS</a> structure is passed as the <b>ServiceSpecificInfo</b> BLOB member of a 
  * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_infoa">SERVICE_INFO</a> structure. Although the <b>ServiceSpecificInfo</b> member generally should not contain pointers, an exception is made in the case of the 
  * <b>SERVICE_TYPE_INFO_ABS</b> and 
  * <b>SERVICE_TYPE_VALUE_ABS</b> structures.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The nspapi.h header defines SERVICE_TYPE_VALUE_ABS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//nspapi/ns-nspapi-service_type_value_absw
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset Unicode
 */
class SERVICE_TYPE_VALUE_ABSW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A namespace, or a set of default namespaces, for which the network service type value is intended. Namespace providers will look only at values intended for their namespace. 
     * 
     * 
     * 
     * 
     * Use one of the following constants to specify a namespace:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_DEFAULT"></a><a id="ns_default"></a><dl>
     * <dt><b>NS_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A set of default namespaces. The function queries each namespace within this set. The set of default namespaces typically includes all the namespaces installed on the system. System administrators, however, can exclude particular namespaces from the set. NS_DEFAULT is the value that most applications should use for <b>dwNameSpace</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_DNS"></a><a id="ns_dns"></a><dl>
     * <dt><b>NS_DNS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Domain Name System used in the Internet for host name resolution.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_NETBT"></a><a id="ns_netbt"></a><dl>
     * <dt><b>NS_NETBT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetBIOS over TCP/IP layer. All Windows operating systems register their computer names with NetBIOS. This namespace is used to convert a computer name to an IP address that uses this registration. Note that NS_NETBT may access a WINS server to perform the resolution.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_SAP"></a><a id="ns_sap"></a><dl>
     * <dt><b>NS_SAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetWare Service Advertising Protocol. This may access the NetWare bindery if appropriate. NS_SAP is a dynamic namespace that allows registration of services.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_TCPIP_HOSTS"></a><a id="ns_tcpip_hosts"></a><dl>
     * <dt><b>NS_TCPIP_HOSTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Lookup value in the &lt;systemroot&gt;\system32\drivers\etc\hosts file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_TCPIP_LOCAL"></a><a id="ns_tcpip_local"></a><dl>
     * <dt><b>NS_TCPIP_LOCAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Local TCP/IP name resolution mechanisms, including comparisons against the local host name and looks up host names and IP addresses in cache of host to IP address mappings.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwNameSpace {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The type of the value data. Specify one of the following types: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_BINARY"></a><a id="reg_binary"></a><dl>
     * <dt><b>REG_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary data in any form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_DWORD"></a><a id="reg_dword"></a><dl>
     * <dt><b>REG_DWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A 32-bit number.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_MULTI_SZ"></a><a id="reg_multi_sz"></a><dl>
     * <dt><b>REG_MULTI_SZ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array of null-terminated strings, terminated by two null characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_SZ"></a><a id="reg_sz"></a><dl>
     * <dt><b>REG_SZ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A null-terminated string.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwValueType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes,  of the value pointed to by the <b>lpValue</b> member. In the case of REG_SZ and REG_MULTI_SZ string data, the terminating characters are counted as part of the size.
     * @type {Integer}
     */
    dwValueSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a <b>NULL</b>-terminated string that is the name of the value. This name is specific to a namespace. 
     * 
     * 
     * 
     * 
     * Several commonly used value name strings are associated with defined constants. These name strings include the following.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_TYPE_VALUE_SAPID"></a><a id="service_type_value_sapid"></a><dl>
     * <dt><b>SERVICE_TYPE_VALUE_SAPID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "SapId"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_TYPE_VALUE_CONN"></a><a id="service_type_value_conn"></a><dl>
     * <dt><b>SERVICE_TYPE_VALUE_CONN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "ConnectionOriented"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_TYPE_VALUE_TCPPORT"></a><a id="service_type_value_tcpport"></a><dl>
     * <dt><b>SERVICE_TYPE_VALUE_TCPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "TcpPort"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_TYPE_VALUE_UDPPORT"></a><a id="service_type_value_udpport"></a><dl>
     * <dt><b>SERVICE_TYPE_VALUE_UDPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "UdpPort"
     * 
     * </td>
     * </tr>
     * </table>
     * @type {PWSTR}
     */
    lpValueName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>PVOID</b>
     * 
     * A pointer to the value data.
     * @type {Pointer<Void>}
     */
    lpValue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
