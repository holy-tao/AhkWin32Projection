#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides relevant information about a given service, including service class ID, service name, applicable namespace identifier and protocol information, as well as a set of transport addresses at which the service listens. (ANSI)
 * @remarks
 * The 
  * <b>WSAQUERYSET</b> structure is used as part of the original namespace provider version 1 architecture available on Windows 95 and later. A newer version 2 of the namespace architecture  is available on Windows Vista and later. 
  * 
  * In most instances, applications interested in only a particular transport protocol should constrain their query by address family and protocol rather than by namespace. This would allow an application that needs to locate a TCP/IP service, for example, to have its query processed by all available namespaces such as the local hosts file, DNS, and NIS.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winsock2.h header defines WSAQUERYSET as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaqueryseta
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset ANSI
 * @deprecated
 */
class WSAQUERYSETA extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the <b>WSAQUERYSET</b> structure. This member is used as a versioning mechanism since the size of the <b>WSAQUERYSET</b> structure has changed on later versions of Windows.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to an optional NULL-terminated string  that contains service name. The semantics for using wildcards within the string are not defined, but can be supported by certain namespace providers.
     * @type {Pointer<PSTR>}
     */
    lpszServiceInstanceName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPGUID</b>
     * 
     * The GUID corresponding to the service class. This member is required to be set.
     * @type {Pointer<Guid>}
     */
    lpServiceClassId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPWSAVERSION</b>
     * 
     * A pointer to an optional desired version number of the namespace provider. This member provides version comparison semantics (that is, the version requested must match exactly, or version must be not less than the value supplied).
     * @type {Pointer<WSAVERSION>}
     */
    lpVersion {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * This member is ignored for queries.
     * @type {Pointer<PSTR>}
     */
    lpszComment {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A namespace identifier that determines which namespace providers are queried.  Passing a specific namespace identifier will result in only namespace providers that support the specified namespace being queried. Specifying <b>NS_ALL</b> will result in all installed and active namespace providers being queried. 
     * 
     * 
     * Options for the <b>dwNameSpace</b> member are listed in the <i>Winsock2.h</i> include file. Several new namespace providers are included with Windows Vista and later. Other namespace providers can be installed, so the following possible values  are only those commonly available. Many other values are possible.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_ALL"></a><a id="ns_all"></a><dl>
     * <dt><b>NS_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All installed and active namespaces.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_BTH"></a><a id="ns_bth"></a><dl>
     * <dt><b>NS_BTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Bluetooth namespace. This namespace identifier is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_DNS"></a><a id="ns_dns"></a><dl>
     * <dt><b>NS_DNS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain name system (DNS) namespace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_EMAIL"></a><a id="ns_email"></a><dl>
     * <dt><b>NS_EMAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The email namespace. This namespace identifier is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_NLA"></a><a id="ns_nla"></a><dl>
     * <dt><b>NS_NLA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location awareness (NLA) namespace. This namespace identifier is supported on Windows XP and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_PNRPNAME"></a><a id="ns_pnrpname"></a><dl>
     * <dt><b>NS_PNRPNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer-to-peer name space for a specific peer name. This namespace identifier is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_PNRPCLOUD"></a><a id="ns_pnrpcloud"></a><dl>
     * <dt><b>NS_PNRPCLOUD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer-to-peer name space for a collection of peer names. This namespace identifier is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwNameSpace {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>LPGUID</b>
     * 
     * A pointer to an optional GUID of a specific namespace provider to query in the case where  multiple namespace providers are registered under a single namespace such as <b>NS_DNS</b>. Passing the GUID for a specific namespace provider will result in only the specified namespace provider being queried. The <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaenumnamespaceprovidersa">WSAEnumNameSpaceProviders</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaenumnamespaceprovidersexa">WSAEnumNameSpaceProvidersEx</a> functions can be called to retrieve the GUID for a namespace provider.
     * @type {Pointer<Guid>}
     */
    lpNSProviderId {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to an optional starting point of the query in a hierarchical namespace.
     * @type {Pointer<PSTR>}
     */
    lpszContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the protocol constraint array. This member can be zero.
     * @type {Integer}
     */
    dwNumberOfProtocols {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>LPAFPROTOCOLS</b>
     * 
     * A pointer to an optional array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-afprotocols">AFPROTOCOLS</a> structures. Only services that utilize these protocols will be returned.
     * @type {Pointer<AFPROTOCOLS>}
     */
    lpafpProtocols {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to an optional NULL-terminated query string. Some namespaces, such as Whois++, support enriched SQL-like queries that are contained in a simple text string. This parameter is used to specify that string.
     * @type {Pointer<PSTR>}
     */
    lpszQueryString {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is ignored for queries.
     * @type {Integer}
     */
    dwNumberOfCsAddrs {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b>LPCSADDR_INFO</b>
     * 
     * This member is ignored for queries.
     * @type {Pointer<CSADDR_INFO>}
     */
    lpcsaBuffer {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is ignored for queries.
     * @type {Integer}
     */
    dwOutputFlags {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b>LPBLOB</b>
     * 
     * An optional pointer to data that is used to query or set provider-specific namespace information. The format of this information is specific to the namespace provider.
     * @type {Pointer<BLOB>}
     */
    lpBlob {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
