#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\System\Com\BLOB.ahk
#Include .\SERVICE_INFOA.ahk

/**
 * Contains information about a network service or a network service type in the context of a specified namespace, or a set of default namespaces. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The nspapi.h header defines NS_SERVICE_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/nspapi/ns-nspapi-ns_service_infoa
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset ANSI
 */
class NS_SERVICE_INFOA extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Namespace, or a set of default namespaces, to which this service information applies. 
     * 
     * 
     * 
     * 
     * Use one of the following constant values to specify a namespace.
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
     * A set of default namespaces. The set of default namespaces typically includes all the namespaces installed on the system. System administrators, however, can exclude particular namespaces from the set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_DNS"></a><a id="ns_dns"></a><dl>
     * <dt><b>NS_DNS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Domain Name System used in the Internet to resolve the name of the host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_MS"></a><a id="ns_ms"></a><dl>
     * <dt><b>NS_MS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Microsoft namespace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_NDS"></a><a id="ns_nds"></a><dl>
     * <dt><b>NS_NDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetWare 4 provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_NETBT"></a><a id="ns_netbt"></a><dl>
     * <dt><b>NS_NETBT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetBIOS over TCP/IP layer. The operating system registers their computer names with NetBIOS. This namespace is used to convert a computer name to an IP address that uses this registration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_NIS"></a><a id="ns_nis"></a><dl>
     * <dt><b>NS_NIS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_SAP"></a><a id="ns_sap"></a><dl>
     * <dt><b>NS_SAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetWare Service Advertising Protocol. This can access the NetWare bindery, if appropriate. NS_SAP is a dynamic namespace that enables the registration of services.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_STDA"></a><a id="ns_stda"></a><dl>
     * <dt><b>NS_STDA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_TCPIP_HOSTS"></a><a id="ns_tcpip_hosts"></a><dl>
     * <dt><b>NS_TCPIP_HOSTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Lookup value in the &lt;systemroot&gt;\system32\drivers\etc\posts file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_TCPIP_LOCAL"></a><a id="ns_tcpip_local"></a><dl>
     * <dt><b>NS_TCPIP_LOCAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Local TCP/IP name resolution mechanisms, including comparisons against the local host name and lookup value in the cache of host to IP address mappings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_WINS"></a><a id="ns_wins"></a><dl>
     * <dt><b>NS_WINS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Internet Name System (WINS) namespace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_X500"></a><a id="ns_x500"></a><dl>
     * <dt><b>NS_X500</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The X.500 directory service namespace.
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
     * Type: <b>SERVICE_INFO</b>
     * 
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_infoa">SERVICE_INFO</a> structure that contains information about a network service or network service type.
     * @type {SERVICE_INFOA}
     */
    ServiceInfo{
        get {
            if(!this.HasProp("__ServiceInfo"))
                this.__ServiceInfo := SERVICE_INFOA(this.ptr + 8)
            return this.__ServiceInfo
        }
    }
}
