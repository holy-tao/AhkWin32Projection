#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUri.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IUriBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUriBuilder
     * @type {Guid}
     */
    static IID => Guid("{4221b2e1-8955-46c0-bd5b-de9897565de7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUriSimple", "CreateUri", "CreateUriWithFlags", "GetIUri", "SetIUri", "GetFragment", "GetHost", "GetPassword", "GetPath", "GetPort", "GetQuery", "GetSchemeName", "GetUserName", "SetFragment", "SetHost", "SetPassword", "SetPath", "SetPort", "SetQuery", "SetSchemeName", "SetUserName", "RemoveProperties", "HasBeenModified"]

    /**
     * 
     * @param {Integer} dwAllowEncodingPropertyMask 
     * @param {Pointer} dwReserved 
     * @returns {IUri} 
     */
    CreateUriSimple(dwAllowEncodingPropertyMask, dwReserved) {
        result := ComCall(3, this, "uint", dwAllowEncodingPropertyMask, "ptr", dwReserved, "ptr*", &ppIUri := 0, "HRESULT")
        return IUri(ppIUri)
    }

    /**
     * 
     * @param {Integer} dwCreateFlags 
     * @param {Integer} dwAllowEncodingPropertyMask 
     * @param {Pointer} dwReserved 
     * @returns {IUri} 
     */
    CreateUri(dwCreateFlags, dwAllowEncodingPropertyMask, dwReserved) {
        result := ComCall(4, this, "uint", dwCreateFlags, "uint", dwAllowEncodingPropertyMask, "ptr", dwReserved, "ptr*", &ppIUri := 0, "HRESULT")
        return IUri(ppIUri)
    }

    /**
     * 
     * @param {Integer} dwCreateFlags 
     * @param {Integer} dwUriBuilderFlags 
     * @param {Integer} dwAllowEncodingPropertyMask 
     * @param {Pointer} dwReserved 
     * @returns {IUri} 
     */
    CreateUriWithFlags(dwCreateFlags, dwUriBuilderFlags, dwAllowEncodingPropertyMask, dwReserved) {
        result := ComCall(5, this, "uint", dwCreateFlags, "uint", dwUriBuilderFlags, "uint", dwAllowEncodingPropertyMask, "ptr", dwReserved, "ptr*", &ppIUri := 0, "HRESULT")
        return IUri(ppIUri)
    }

    /**
     * 
     * @returns {IUri} 
     */
    GetIUri() {
        result := ComCall(6, this, "ptr*", &ppIUri := 0, "HRESULT")
        return IUri(ppIUri)
    }

    /**
     * 
     * @param {IUri} pIUri 
     * @returns {HRESULT} 
     */
    SetIUri(pIUri) {
        result := ComCall(7, this, "ptr", pIUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchFragment 
     * @param {Pointer<PWSTR>} ppwzFragment 
     * @returns {HRESULT} 
     */
    GetFragment(pcchFragment, ppwzFragment) {
        pcchFragmentMarshal := pcchFragment is VarRef ? "uint*" : "ptr"
        ppwzFragmentMarshal := ppwzFragment is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, pcchFragmentMarshal, pcchFragment, ppwzFragmentMarshal, ppwzFragment, "HRESULT")
        return result
    }

    /**
     * The GetHostNameW function retrieves the standard host name for the local computer as a Unicode string.
     * @remarks
     * The 
     * <b>GetHostNameW</b> function returns the name of the local host into the buffer specified by the <i>name</i> parameter in Unicode (UTF-16). The host name is returned as a <b>null</b>-terminated Unicode string. The form of the host name is dependent on the Windows Sockets provider—it can be a simple host name, or it can be a fully qualified domain name. However, it is guaranteed that the name returned will be successfully parsed by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfow">GetAddrInfoW</a>.
     * 
     * With the growth of the Internet, there is a growing need to identify Internet host names for other languages not represented by the ASCII character set. Identifiers which facilitate this need and allow non-ASCII characters (Unicode) to be represented as special ASCII character strings (Punycode) are known as Internationalized Domain Names (IDNs). A  mechanism called
     *    Internationalizing Domain Names in Applications (IDNA) is used to handle
     *    IDNs in a standard fashion. The <b>GetHostNameW</b> function does not convert the local hostname between Punycode and Unicode. The <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfow">GetAddrInfoW</a> function provides support for Internationalized Domain Name (IDN) parsing and performs Punycode/IDN encoding and conversion.  
     * 
     * If the 
     * <b>GetHostNameW</b> function is used on a cluster resource on Windows Server 2012 and the _CLUSTER_NETWORK_NAME_ environment variable is defined, then the value in this environment variable overrides the actual hostname and is returned. On a cluster resource, the _CLUSTER_NETWORK_NAME_ environment variable contains the name of the cluster.
     * 
     * The 
     * <b>GetHostNameW</b> function queries namespace providers to determine the local host name using the SVCID_HOSTNAME GUID defined in the <i>Svgguid.h</i> header file. If no namespace provider responds, then the 
     * <b>GetHostNameW</b> function returns the NetBIOS name of the local computer in Unicode.
     * 
     * The maximum length, in wide characters, of the string returned in the buffer pointed to by the <i>name</i> parameter is dependent on the namespace provider, but this string must be 256 wide characters or less. So if a buffer of 256 wide characters is passed in the <i>name</i> parameter and the <i>namelen</i> parameter is set to 256, the buffer size will always be adequate.
     * 
     * 
     * <div class="alert"><b>Note</b>  If no local host name has been configured, 
     * <b>GetHostNameW</b> must succeed and return a token host name that 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfow">GetAddrInfoW</a> can resolve.</div>
     * <div> </div>
     * 
     * 
     * <b>Windows Phone 8:</b> This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * @param {Pointer<Integer>} pcchHost 
     * @param {Pointer<PWSTR>} ppwzHost 
     * @returns {HRESULT} If no error occurs, 
     * <b>GetHostNameW</b> returns zero. Otherwise, it returns <b>SOCKET_ERROR</b> and a specific error code can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsagetlasterror">WSAGetLastError</a>.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>name</i> parameter is a <b>NULL</b> pointer or is not a valid part of the user address space. This error is also returned if the buffer size specified by <i>namelen</i> parameter is too small to hold the complete host name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANOTINITIALISED</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A successful 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> call must occur before using this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAENETDOWN</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network subsystem has failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsock2/nf-winsock2-gethostnamew
     */
    GetHost(pcchHost, ppwzHost) {
        pcchHostMarshal := pcchHost is VarRef ? "uint*" : "ptr"
        ppwzHostMarshal := ppwzHost is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pcchHostMarshal, pcchHost, ppwzHostMarshal, ppwzHost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchPassword 
     * @param {Pointer<PWSTR>} ppwzPassword 
     * @returns {HRESULT} 
     */
    GetPassword(pcchPassword, ppwzPassword) {
        pcchPasswordMarshal := pcchPassword is VarRef ? "uint*" : "ptr"
        ppwzPasswordMarshal := ppwzPassword is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, pcchPasswordMarshal, pcchPassword, ppwzPasswordMarshal, ppwzPassword, "HRESULT")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @remarks
     * The device context identified by the <i>hdc</i> parameter must contain a closed path.
     * 
     * The points of the path are returned in logical coordinates. Points are stored in the path in device coordinates, so <b>GetPath</b> changes the points from device coordinates to logical coordinates by using the inverse of the current transformation.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-flattenpath">FlattenPath</a> function may be called before <b>GetPath</b> to convert all curves in the path into line segments.
     * @param {Pointer<Integer>} pcchPath 
     * @param {Pointer<PWSTR>} ppwzPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getpath
     */
    GetPath(pcchPath, ppwzPath) {
        pcchPathMarshal := pcchPath is VarRef ? "uint*" : "ptr"
        ppwzPathMarshal := ppwzPath is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, pcchPathMarshal, pcchPath, ppwzPathMarshal, ppwzPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasPort 
     * @param {Pointer<Integer>} pdwPort 
     * @returns {HRESULT} 
     */
    GetPort(pfHasPort, pdwPort) {
        pfHasPortMarshal := pfHasPort is VarRef ? "int*" : "ptr"
        pdwPortMarshal := pdwPort is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pfHasPortMarshal, pfHasPort, pdwPortMarshal, pdwPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchQuery 
     * @param {Pointer<PWSTR>} ppwzQuery 
     * @returns {HRESULT} 
     */
    GetQuery(pcchQuery, ppwzQuery) {
        pcchQueryMarshal := pcchQuery is VarRef ? "uint*" : "ptr"
        ppwzQueryMarshal := ppwzQuery is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, pcchQueryMarshal, pcchQuery, ppwzQueryMarshal, ppwzQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchSchemeName 
     * @param {Pointer<PWSTR>} ppwzSchemeName 
     * @returns {HRESULT} 
     */
    GetSchemeName(pcchSchemeName, ppwzSchemeName) {
        pcchSchemeNameMarshal := pcchSchemeName is VarRef ? "uint*" : "ptr"
        ppwzSchemeNameMarshal := ppwzSchemeName is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, pcchSchemeNameMarshal, pcchSchemeName, ppwzSchemeNameMarshal, ppwzSchemeName, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the user associated with the current thread. (Unicode)
     * @remarks
     * If the current thread is impersonating another client, the 
     * <b>GetUserName</b> function returns the user name of the client that the thread is impersonating.
     * 
     * If <b>GetUserName</b> is called from a process that is running under the  "NETWORK SERVICE" account, the string returned in <i>lpBuffer</i> may be different depending on the version of Windows.  On Windows XP, the "NETWORK SERVICE" string is returned. On Windows Vista, the “&lt;HOSTNAME&gt;$” string is returned.
     * @param {Pointer<Integer>} pcchUserName 
     * @param {Pointer<PWSTR>} ppwzUserName 
     * @returns {HRESULT} If the function succeeds, the return value is a nonzero value, and the variable pointed to by <i>lpnSize</i> contains the number of <b>TCHARs</b> copied to the buffer specified by <i>lpBuffer</i>, including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getusernamew
     */
    GetUserName(pcchUserName, ppwzUserName) {
        pcchUserNameMarshal := pcchUserName is VarRef ? "uint*" : "ptr"
        ppwzUserNameMarshal := ppwzUserName is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, pcchUserNameMarshal, pcchUserName, ppwzUserNameMarshal, ppwzUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetFragment(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(16, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetHost(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(17, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetPassword(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(18, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetPath(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(19, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * The SetPort function sets the status associated with a printer port.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller of the **SetPort** function must be executing as an Administrator. Additionally, if the caller is a Port Monitor or Language Monitor, it must call [**RevertToSelf**](/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself) to cease impersonation before it calls **SetPort**.
     * 
     * All programs that call **SetPort** must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
     * 
     * When you set a printer port status value with the severity value PORT\_STATUS\_TYPE\_ERROR, the print spooler stops sending jobs to the port. The print spooler resumes sending jobs to the port when the port status is cleared by another call to **SetPort**.
     * @param {BOOL} fHasPort 
     * @param {Integer} dwNewValue 
     * @returns {HRESULT} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setport
     */
    SetPort(fHasPort, dwNewValue) {
        result := ComCall(20, this, "int", fHasPort, "uint", dwNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetQuery(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(21, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetSchemeName(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(22, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetUserName(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(23, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPropertyMask 
     * @returns {HRESULT} 
     */
    RemoveProperties(dwPropertyMask) {
        result := ComCall(24, this, "uint", dwPropertyMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    HasBeenModified() {
        result := ComCall(25, this, "int*", &pfModified := 0, "HRESULT")
        return pfModified
    }
}
