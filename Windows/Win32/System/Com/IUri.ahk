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
     * 
     * @returns {BSTR} 
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
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
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
     * 
     * @returns {BSTR} 
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
     * 
     * @param {IUri} pUri 
     * @returns {BOOL} 
     */
    IsEqual(pUri) {
        result := ComCall(27, this, "ptr", pUri, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }
}
