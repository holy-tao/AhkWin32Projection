#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\Uri_PROPERTY.ahk
#Include .\IUnknown.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class IUri extends IUnknown {

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
     * @param {Uri_PROPERTY} uriProp 
     * @param {Integer} dwFlags 
     * @returns {BSTR} 
     */
    GetPropertyBSTR(uriProp, dwFlags) {
        pbstrProperty := BSTR({Value: 0}, True)
        result := ComCall(3, this, "int", uriProp, "ptr", pbstrProperty, "uint", dwFlags, "HRESULT")
        return pbstrProperty
    }

    /**
     * 
     * @param {Uri_PROPERTY} uriProp 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    GetPropertyLength(uriProp, dwFlags) {
        result := ComCall(4, this, "int", uriProp, "uint*", &pcchProperty := 0, "uint", dwFlags, "HRESULT")
        return pcchProperty
    }

    /**
     * 
     * @param {Uri_PROPERTY} uriProp 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    GetPropertyDWORD(uriProp, dwFlags) {
        result := ComCall(5, this, "int", uriProp, "uint*", &pdwProperty := 0, "uint", dwFlags, "HRESULT")
        return pdwProperty
    }

    /**
     * 
     * @param {Uri_PROPERTY} uriProp 
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
        pbstrAbsoluteUri := BSTR({Value: 0}, True)
        result := ComCall(7, this, "ptr", pbstrAbsoluteUri, "HRESULT")
        return pbstrAbsoluteUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetAuthority() {
        pbstrAuthority := BSTR({Value: 0}, True)
        result := ComCall(8, this, "ptr", pbstrAuthority, "HRESULT")
        return pbstrAuthority
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayUri() {
        pbstrDisplayString := BSTR({Value: 0}, True)
        result := ComCall(9, this, "ptr", pbstrDisplayString, "HRESULT")
        return pbstrDisplayString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDomain() {
        pbstrDomain := BSTR({Value: 0}, True)
        result := ComCall(10, this, "ptr", pbstrDomain, "HRESULT")
        return pbstrDomain
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetExtension() {
        pbstrExtension := BSTR({Value: 0}, True)
        result := ComCall(11, this, "ptr", pbstrExtension, "HRESULT")
        return pbstrExtension
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetFragment() {
        pbstrFragment := BSTR({Value: 0}, True)
        result := ComCall(12, this, "ptr", pbstrFragment, "HRESULT")
        return pbstrFragment
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetHost() {
        pbstrHost := BSTR({Value: 0}, True)
        result := ComCall(13, this, "ptr", pbstrHost, "HRESULT")
        return pbstrHost
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetPassword() {
        pbstrPassword := BSTR({Value: 0}, True)
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
        pbstrPath := BSTR({Value: 0}, True)
        result := ComCall(15, this, "ptr", pbstrPath, "HRESULT")
        return pbstrPath
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetPathAndQuery() {
        pbstrPathAndQuery := BSTR({Value: 0}, True)
        result := ComCall(16, this, "ptr", pbstrPathAndQuery, "HRESULT")
        return pbstrPathAndQuery
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetQuery() {
        pbstrQuery := BSTR({Value: 0}, True)
        result := ComCall(17, this, "ptr", pbstrQuery, "HRESULT")
        return pbstrQuery
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetRawUri() {
        pbstrRawUri := BSTR({Value: 0}, True)
        result := ComCall(18, this, "ptr", pbstrRawUri, "HRESULT")
        return pbstrRawUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSchemeName() {
        pbstrSchemeName := BSTR({Value: 0}, True)
        result := ComCall(19, this, "ptr", pbstrSchemeName, "HRESULT")
        return pbstrSchemeName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetUserInfo() {
        pbstrUserInfo := BSTR({Value: 0}, True)
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
        pbstrUserName := BSTR({Value: 0}, True)
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
     * 
     * @param {IUri} pUri 
     * @returns {BOOL} 
     */
    IsEqual(pUri) {
        result := ComCall(27, this, "ptr", pUri, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }
}
