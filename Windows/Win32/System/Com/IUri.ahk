#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IUri extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUri
     * @type {Guid}
     */
    static IID => Guid("{a39ee748-6a27-4817-a6f2-13914bef5890}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyBSTR", "GetPropertyLength", "GetPropertyDWORD", "HasProperty", "GetAbsoluteUri", "GetAuthority", "GetDisplayUri", "GetDomain", "GetExtension", "GetFragment", "GetHost", "GetPassword", "GetPath", "GetPathAndQuery", "GetQuery", "GetRawUri", "GetSchemeName", "GetUserInfo", "GetUserName", "GetHostType", "GetPort", "GetScheme", "GetZone", "GetProperties", "IsEqual"]

    /**
     * 
     * @param {Integer} uriProp 
     * @param {Integer} dwFlags 
     * @returns {BSTR} 
     */
    GetPropertyBSTR(uriProp, dwFlags) {
        pbstrProperty := BSTR()
        result := ComCall(3, this, "int", uriProp, "ptr", pbstrProperty, "uint", dwFlags, "HRESULT")
        return pbstrProperty
    }

    /**
     * 
     * @param {Integer} uriProp 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    GetPropertyLength(uriProp, dwFlags) {
        result := ComCall(4, this, "int", uriProp, "uint*", &pcchProperty := 0, "uint", dwFlags, "HRESULT")
        return pcchProperty
    }

    /**
     * 
     * @param {Integer} uriProp 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    GetPropertyDWORD(uriProp, dwFlags) {
        result := ComCall(5, this, "int", uriProp, "uint*", &pdwProperty := 0, "uint", dwFlags, "HRESULT")
        return pdwProperty
    }

    /**
     * 
     * @param {Integer} uriProp 
     * @returns {BOOL} 
     */
    HasProperty(uriProp) {
        result := ComCall(6, this, "int", uriProp, "int*", &pfHasProperty := 0, "HRESULT")
        return pfHasProperty
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetAbsoluteUri() {
        pbstrAbsoluteUri := BSTR()
        result := ComCall(7, this, "ptr", pbstrAbsoluteUri, "HRESULT")
        return pbstrAbsoluteUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetAuthority() {
        pbstrAuthority := BSTR()
        result := ComCall(8, this, "ptr", pbstrAuthority, "HRESULT")
        return pbstrAuthority
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayUri() {
        pbstrDisplayString := BSTR()
        result := ComCall(9, this, "ptr", pbstrDisplayString, "HRESULT")
        return pbstrDisplayString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDomain() {
        pbstrDomain := BSTR()
        result := ComCall(10, this, "ptr", pbstrDomain, "HRESULT")
        return pbstrDomain
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetExtension() {
        pbstrExtension := BSTR()
        result := ComCall(11, this, "ptr", pbstrExtension, "HRESULT")
        return pbstrExtension
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetFragment() {
        pbstrFragment := BSTR()
        result := ComCall(12, this, "ptr", pbstrFragment, "HRESULT")
        return pbstrFragment
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/winsock2/nf-winsock2-gethostnamew
     */
    GetHost() {
        pbstrHost := BSTR()
        result := ComCall(13, this, "ptr", pbstrHost, "HRESULT")
        return pbstrHost
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetPassword() {
        pbstrPassword := BSTR()
        result := ComCall(14, this, "ptr", pbstrPassword, "HRESULT")
        return pbstrPassword
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @remarks
     * The device context identified by the <i>hdc</i> parameter must contain a closed path.
     * 
     * The points of the path are returned in logical coordinates. Points are stored in the path in device coordinates, so <b>GetPath</b> changes the points from device coordinates to logical coordinates by using the inverse of the current transformation.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-flattenpath">FlattenPath</a> function may be called before <b>GetPath</b> to convert all curves in the path into line segments.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getpath
     */
    GetPath() {
        pbstrPath := BSTR()
        result := ComCall(15, this, "ptr", pbstrPath, "HRESULT")
        return pbstrPath
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetPathAndQuery() {
        pbstrPathAndQuery := BSTR()
        result := ComCall(16, this, "ptr", pbstrPathAndQuery, "HRESULT")
        return pbstrPathAndQuery
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetQuery() {
        pbstrQuery := BSTR()
        result := ComCall(17, this, "ptr", pbstrQuery, "HRESULT")
        return pbstrQuery
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetRawUri() {
        pbstrRawUri := BSTR()
        result := ComCall(18, this, "ptr", pbstrRawUri, "HRESULT")
        return pbstrRawUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSchemeName() {
        pbstrSchemeName := BSTR()
        result := ComCall(19, this, "ptr", pbstrSchemeName, "HRESULT")
        return pbstrSchemeName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetUserInfo() {
        pbstrUserInfo := BSTR()
        result := ComCall(20, this, "ptr", pbstrUserInfo, "HRESULT")
        return pbstrUserInfo
    }

    /**
     * Retrieves the name of the user associated with the current thread. (Unicode)
     * @remarks
     * If the current thread is impersonating another client, the 
     * <b>GetUserName</b> function returns the user name of the client that the thread is impersonating.
     * 
     * If <b>GetUserName</b> is called from a process that is running under the  "NETWORK SERVICE" account, the string returned in <i>lpBuffer</i> may be different depending on the version of Windows.  On Windows XP, the "NETWORK SERVICE" string is returned. On Windows Vista, the “&lt;HOSTNAME&gt;$” string is returned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getusernamew
     */
    GetUserName() {
        pbstrUserName := BSTR()
        result := ComCall(21, this, "ptr", pbstrUserName, "HRESULT")
        return pbstrUserName
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetHostType() {
        result := ComCall(22, this, "uint*", &pdwHostType := 0, "HRESULT")
        return pdwHostType
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPort() {
        result := ComCall(23, this, "uint*", &pdwPort := 0, "HRESULT")
        return pdwPort
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetScheme() {
        result := ComCall(24, this, "uint*", &pdwScheme := 0, "HRESULT")
        return pdwScheme
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetZone() {
        result := ComCall(25, this, "uint*", &pdwZone := 0, "HRESULT")
        return pdwZone
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetProperties() {
        result := ComCall(26, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Evaluates to a Boolean value that indicates whether two CLSIDs are equal.
     * @param {IUri} pUri 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/guiddef/nf-guiddef-isequalclsid
     */
    IsEqual(pUri) {
        result := ComCall(27, this, "ptr", pUri, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }
}
