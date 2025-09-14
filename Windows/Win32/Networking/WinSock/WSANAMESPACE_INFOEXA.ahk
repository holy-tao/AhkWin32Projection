#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\BLOB.ahk

/**
 * Contains all registration information for a namespace provider. (WSANAMESPACE_INFOEXA)
 * @remarks
 * The <b>WSANAMESPACE_INFOEX</b>  structure is an enhanced version of the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsanamespace_infow">WSANAMESPACE_INFO</a> structure that is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaenumnamespaceprovidersexa">WSAEnumNameSpaceProvidersEx</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscenumnamespaceprovidersex32">WSCEnumNameSpaceProvidersEx32</a> functions to return information on available namespace providers. The <b>WSANAMESPACE_INFOEX</b>  structure contains the provider-specific data blob associated with the namespace entry
  *                      passed in the <i>lpProviderInfo</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscinstallnamespaceex">WSCInstallNameSpaceEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscinstallnamespaceex32">WSCInstallNameSpaceEx32</a> functions.
  * 
  *   Currently, the only namespace included with Windows that uses information in the <b>ProviderSpecific</b> member of the <b>WSANAMESPACE_INFOEX</b> structure are namespace providers for the NS_EMAIL namespace. The format of the <b>ProviderSpecific</b> member for an NS_EMAIL namespace provider is a <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_provider_installation_blob">NAPI_PROVIDER_INSTALLATION_BLOB</a> structure.
  * 
  * When UNICODE or _UNICODE is defined, <b>WSANAMESPACE_INFOEX</b> is defined to <b>WSANAMESPACE_INFOEXW</b>, the Unicode version of this structure and the <b>lpszIdentifier</b> string member is defined to the  <b>LPWSTR</b> data type.
  * 
  * When UNICODE or _UNICODE is not defined, <b>WSANAMESPACE_INFOEX</b> is defined to <b>WSANAMESPACE_INFOEXA</b>, the ANSI version of this structure and the <b>lpszIdentifier</b> string member is defined to the  <b>LPSTR</b> data type.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscenumnamespaceprovidersex32">WSCEnumNameSpaceProvidersEx32</a> function is a Unicode only function and returns <b>WSANAMESPACE_INFOEXW</b> structures. 
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winsock2.h header defines WSANAMESPACE_INFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanamespace_infoexa
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset ANSI
 * @deprecated
 */
class WSANAMESPACE_INFOEXA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * A unique GUID for this namespace provider.
     * @type {Pointer<Guid>}
     */
    NSProviderId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The namespace supported by this provider.
     * 
     * 
     * Possible values for the <b>dwNameSpace</b> member are listed in the <i>Winsock2.h</i> include file. Several namespace providers are included with Windows Vista and later. Other namespace providers can be installed, so the following possible values  are only those commonly available. Many other values are possible.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_BTH"></a><a id="ns_bth"></a><dl>
     * <dt><b>NS_BTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Bluetooth namespace. 
     * 
     * This namespace identifier is supported on Windows Vista and later.
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
     * The email namespace. 
     * 
     * This namespace identifier is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_NLA"></a><a id="ns_nla"></a><dl>
     * <dt><b>NS_NLA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location awareness (NLA) namespace. 
     * 
     * This namespace identifier is supported on Windows XP and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_NTDS"></a><a id="ns_ntds"></a><dl>
     * <dt><b>NS_NTDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows NT directory service  (NTDS) namespace. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_PNRPNAME"></a><a id="ns_pnrpname"></a><dl>
     * <dt><b>NS_PNRPNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer-to-peer name space for a specific peer name. 
     * 
     * This namespace identifier is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_PNRPCLOUD"></a><a id="ns_pnrpcloud"></a><dl>
     * <dt><b>NS_PNRPCLOUD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer-to-peer name space for a collection of peer names. 
     * 
     * This namespace identifier is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwNameSpace {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * If <b>TRUE</b>, indicates that this namespace provider is active. If <b>FALSE</b>, the namespace provider is inactive and is not accessible for queries, even if the query specifically references this namespace provider.
     * @type {Integer}
     */
    fActive {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The version number of the namespace provider.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A display string that identifies the namespace provider.
     * @type {Pointer<PSTR>}
     */
    lpszIdentifier {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>BLOB</b>
     * 
     * A provider-specific data blob associated with namespace entry.
     * @type {BLOB}
     */
    ProviderSpecific{
        get {
            if(!this.HasProp("__ProviderSpecific"))
                this.__ProviderSpecific := BLOB(this.ptr + 32)
            return this.__ProviderSpecific
        }
    }
}
