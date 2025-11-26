#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWbemServices.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Use the IWbemLocator interface to obtain the initial namespace pointer to the IWbemServices interface for WMI on a specific host computer.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemlocator
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemLocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemLocator
     * @type {Guid}
     */
    static IID => Guid("{dc12a687-737f-11cf-884d-00aa004b2e24}")

    /**
     * The class identifier for WbemLocator
     * @type {Guid}
     */
    static CLSID => Guid("{4590f811-1d3a-11d0-891f-00aa004b2e24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectServer"]

    /**
     * The IWbemLocator::ConnectServer method creates a connection through DCOM to a WMI namespace on the computer specified in the strNetworkResource parameter.
     * @param {BSTR} strNetworkResource Pointer to a valid <b>BSTR</b> that contains the object path of the correct WMI namespace. For local access to the default namespace, use a simple object path: "root\default" or "\\.\root\default". For access to the default namespace on a remote computer using COM or Microsoft-compatible networking, include the computer name: "\\myserver\root\default".  For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/describing-a-wmi-namespace-object-path">Describing a WMI Namespace Object Path</a>. The computer name also can  be a DNS name or IP  address. Starting with Windows Vista, <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemlocator-connectserver">SWbemLocator.ConnectServer</a> can connect with computers running IPv6 using an IPv6 address. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/ipv6-and-ipv4-support-in-wmi">IPv6 and IPv4 Support in WMI</a>.
     * @param {BSTR} strUser Pointer to a valid <b>BSTR</b>, which contains the user name you need for a connection. A <b>NULL</b> value indicates the current security context. If the user name is from a domain different from the current domain, the string may contain the domain name and user name  separated by a backslash.
     * 
     * <c>StrUserName = SysAllocString(L"Domain\\UserName");</c>
     * 
     * The <i>strUser</i> parameter cannot be an empty string.
     * Note that if the domain is specified in <i>strAuthority</i>, then it must not be specified here. Specifying the domain in both parameters results in an invalid parameter error.
     * 
     * You can use the user principal name (UPN) format, which is <i>Username@DomainName</i> to specify the <i>strUser</i>.
     * @param {BSTR} strPassword Pointer to a valid <b>BSTR</b> that contains the password you need for a connection. A <b>NULL</b> value indicates the current security context. A blank string  ""  specifies a valid zero-length password.
     * @param {BSTR} strLocale If <b>NULL</b>, the current locale is used. If not <b>NULL</b>, this parameter must be a valid <b>BSTR</b>, which indicates the correct locale for information retrieval. For Microsoft locale identifiers, the format of the string is "MS_xxx", where xxx is a string in hexadecimal form that indicates the Local Identification (LCID), for example, American English would appear as "MS_409". If an invalid locale is specified, then the method returns <b>WBEM_E_INVALID_PARAMETER</b>.
     * 
     * <b>Windows 7:  </b>If an invalid locale is specified, then the default locale of the server is used unless there is a server-supported locale provided by the user application.
     * @param {Integer} lSecurityFlags Long value used to pass flag values to 
     * <b>ConnectServer</b>. A value of zero (0) for this parameter results in the call to 
     * <b>ConnectServer</b> returning only after connection to the server is established. This could result in your program ceasing to respond indefinitely if the server is broken. The following list lists the other valid values for <i>lSecurityFlags</i>.
     * @param {BSTR} strAuthority This parameter contains the name of the domain of the user to authenticate.
     * 
     * <i>strAuthority</i> can have the following values:
     * 
     * <ul>
     * <li>
     * blank
     * 
     * If you leave this parameter blank, NTLM authentication is used and the NTLM domain of the current user is used. If the domain  is specified in <i>strUser</i>, which is the recommended location, then it must not be specified here. Specifying the domain in both parameters results in an invalid parameter error.
     * 
     * </li>
     * <li>
     * Kerberos:&lt;<i>principal name</i>&gt;
     * 
     * Kerberos authentication is used and this parameter should contain a Kerberos principal name.
     * 
     * </li>
     * <li>
     * NTLMDOMAIN:&lt;<i>domain name</i>&gt;
     * 
     * NT LAN Manager authentication is used and this parameter should contain an NTLM domain name.
     * 
     * </li>
     * </ul>
     * @param {IWbemContext} pCtx Typically, this is <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object required by one or more dynamic class providers. The values in the context object must be specified in the documentation for the providers in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @returns {IWbemServices} Receives a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> object bound to the specified namespace. This pointer has a positive reference count. The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IWbemServices::Release</a> on the pointer when it is no longer required. This pointer is set to point to <b>NULL</b> when there is an error.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemlocator-connectserver
     */
    ConnectServer(strNetworkResource, strUser, strPassword, strLocale, lSecurityFlags, strAuthority, pCtx) {
        strNetworkResource := strNetworkResource is String ? BSTR.Alloc(strNetworkResource).Value : strNetworkResource
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale
        strAuthority := strAuthority is String ? BSTR.Alloc(strAuthority).Value : strAuthority

        result := ComCall(3, this, "ptr", strNetworkResource, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lSecurityFlags, "ptr", strAuthority, "ptr", pCtx, "ptr*", &ppNamespace := 0, "HRESULT")
        return IWbemServices(ppNamespace)
    }
}
