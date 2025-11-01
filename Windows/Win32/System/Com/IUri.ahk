#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<BSTR>} pbstrProperty 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetPropertyBSTR(uriProp, pbstrProperty, dwFlags) {
        result := ComCall(3, this, "int", uriProp, "ptr", pbstrProperty, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uriProp 
     * @param {Pointer<Integer>} pcchProperty 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetPropertyLength(uriProp, pcchProperty, dwFlags) {
        result := ComCall(4, this, "int", uriProp, "uint*", pcchProperty, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uriProp 
     * @param {Pointer<Integer>} pdwProperty 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetPropertyDWORD(uriProp, pdwProperty, dwFlags) {
        result := ComCall(5, this, "int", uriProp, "uint*", pdwProperty, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uriProp 
     * @param {Pointer<BOOL>} pfHasProperty 
     * @returns {HRESULT} 
     */
    HasProperty(uriProp, pfHasProperty) {
        result := ComCall(6, this, "int", uriProp, "ptr", pfHasProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAbsoluteUri 
     * @returns {HRESULT} 
     */
    GetAbsoluteUri(pbstrAbsoluteUri) {
        result := ComCall(7, this, "ptr", pbstrAbsoluteUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAuthority 
     * @returns {HRESULT} 
     */
    GetAuthority(pbstrAuthority) {
        result := ComCall(8, this, "ptr", pbstrAuthority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisplayString 
     * @returns {HRESULT} 
     */
    GetDisplayUri(pbstrDisplayString) {
        result := ComCall(9, this, "ptr", pbstrDisplayString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDomain 
     * @returns {HRESULT} 
     */
    GetDomain(pbstrDomain) {
        result := ComCall(10, this, "ptr", pbstrDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtension 
     * @returns {HRESULT} 
     */
    GetExtension(pbstrExtension) {
        result := ComCall(11, this, "ptr", pbstrExtension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFragment 
     * @returns {HRESULT} 
     */
    GetFragment(pbstrFragment) {
        result := ComCall(12, this, "ptr", pbstrFragment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrHost 
     * @returns {HRESULT} 
     */
    GetHost(pbstrHost) {
        result := ComCall(13, this, "ptr", pbstrHost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPassword 
     * @returns {HRESULT} 
     */
    GetPassword(pbstrPassword) {
        result := ComCall(14, this, "ptr", pbstrPassword, "HRESULT")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<BSTR>} pbstrPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pbstrPath) {
        result := ComCall(15, this, "ptr", pbstrPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPathAndQuery 
     * @returns {HRESULT} 
     */
    GetPathAndQuery(pbstrPathAndQuery) {
        result := ComCall(16, this, "ptr", pbstrPathAndQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrQuery 
     * @returns {HRESULT} 
     */
    GetQuery(pbstrQuery) {
        result := ComCall(17, this, "ptr", pbstrQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRawUri 
     * @returns {HRESULT} 
     */
    GetRawUri(pbstrRawUri) {
        result := ComCall(18, this, "ptr", pbstrRawUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSchemeName 
     * @returns {HRESULT} 
     */
    GetSchemeName(pbstrSchemeName) {
        result := ComCall(19, this, "ptr", pbstrSchemeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserInfo 
     * @returns {HRESULT} 
     */
    GetUserInfo(pbstrUserInfo) {
        result := ComCall(20, this, "ptr", pbstrUserInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserName 
     * @returns {HRESULT} 
     */
    GetUserName(pbstrUserName) {
        result := ComCall(21, this, "ptr", pbstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwHostType 
     * @returns {HRESULT} 
     */
    GetHostType(pdwHostType) {
        result := ComCall(22, this, "uint*", pdwHostType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPort 
     * @returns {HRESULT} 
     */
    GetPort(pdwPort) {
        result := ComCall(23, this, "uint*", pdwPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwScheme 
     * @returns {HRESULT} 
     */
    GetScheme(pdwScheme) {
        result := ComCall(24, this, "uint*", pdwScheme, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwZone 
     * @returns {HRESULT} 
     */
    GetZone(pdwZone) {
        result := ComCall(25, this, "uint*", pdwZone, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetProperties(pdwFlags) {
        result := ComCall(26, this, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUri} pUri 
     * @param {Pointer<BOOL>} pfEqual 
     * @returns {HRESULT} 
     */
    IsEqual(pUri, pfEqual) {
        result := ComCall(27, this, "ptr", pUri, "ptr", pfEqual, "HRESULT")
        return result
    }
}
