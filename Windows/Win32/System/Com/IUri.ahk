#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IUri extends IUnknown{
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
     * 
     * @param {Integer} uriProp 
     * @param {Pointer<BSTR>} pbstrProperty 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetPropertyBSTR(uriProp, pbstrProperty, dwFlags) {
        result := ComCall(3, this, "int", uriProp, "ptr", pbstrProperty, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uriProp 
     * @param {Pointer<UInt32>} pcchProperty 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetPropertyLength(uriProp, pcchProperty, dwFlags) {
        result := ComCall(4, this, "int", uriProp, "uint*", pcchProperty, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uriProp 
     * @param {Pointer<UInt32>} pdwProperty 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetPropertyDWORD(uriProp, pdwProperty, dwFlags) {
        result := ComCall(5, this, "int", uriProp, "uint*", pdwProperty, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uriProp 
     * @param {Pointer<BOOL>} pfHasProperty 
     * @returns {HRESULT} 
     */
    HasProperty(uriProp, pfHasProperty) {
        result := ComCall(6, this, "int", uriProp, "ptr", pfHasProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAbsoluteUri 
     * @returns {HRESULT} 
     */
    GetAbsoluteUri(pbstrAbsoluteUri) {
        result := ComCall(7, this, "ptr", pbstrAbsoluteUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAuthority 
     * @returns {HRESULT} 
     */
    GetAuthority(pbstrAuthority) {
        result := ComCall(8, this, "ptr", pbstrAuthority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisplayString 
     * @returns {HRESULT} 
     */
    GetDisplayUri(pbstrDisplayString) {
        result := ComCall(9, this, "ptr", pbstrDisplayString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDomain 
     * @returns {HRESULT} 
     */
    GetDomain(pbstrDomain) {
        result := ComCall(10, this, "ptr", pbstrDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtension 
     * @returns {HRESULT} 
     */
    GetExtension(pbstrExtension) {
        result := ComCall(11, this, "ptr", pbstrExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFragment 
     * @returns {HRESULT} 
     */
    GetFragment(pbstrFragment) {
        result := ComCall(12, this, "ptr", pbstrFragment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrHost 
     * @returns {HRESULT} 
     */
    GetHost(pbstrHost) {
        result := ComCall(13, this, "ptr", pbstrHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPassword 
     * @returns {HRESULT} 
     */
    GetPassword(pbstrPassword) {
        result := ComCall(14, this, "ptr", pbstrPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<BSTR>} pbstrPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pbstrPath) {
        result := ComCall(15, this, "ptr", pbstrPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPathAndQuery 
     * @returns {HRESULT} 
     */
    GetPathAndQuery(pbstrPathAndQuery) {
        result := ComCall(16, this, "ptr", pbstrPathAndQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrQuery 
     * @returns {HRESULT} 
     */
    GetQuery(pbstrQuery) {
        result := ComCall(17, this, "ptr", pbstrQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRawUri 
     * @returns {HRESULT} 
     */
    GetRawUri(pbstrRawUri) {
        result := ComCall(18, this, "ptr", pbstrRawUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSchemeName 
     * @returns {HRESULT} 
     */
    GetSchemeName(pbstrSchemeName) {
        result := ComCall(19, this, "ptr", pbstrSchemeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserInfo 
     * @returns {HRESULT} 
     */
    GetUserInfo(pbstrUserInfo) {
        result := ComCall(20, this, "ptr", pbstrUserInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserName 
     * @returns {HRESULT} 
     */
    GetUserName(pbstrUserName) {
        result := ComCall(21, this, "ptr", pbstrUserName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwHostType 
     * @returns {HRESULT} 
     */
    GetHostType(pdwHostType) {
        result := ComCall(22, this, "uint*", pdwHostType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPort 
     * @returns {HRESULT} 
     */
    GetPort(pdwPort) {
        result := ComCall(23, this, "uint*", pdwPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwScheme 
     * @returns {HRESULT} 
     */
    GetScheme(pdwScheme) {
        result := ComCall(24, this, "uint*", pdwScheme, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwZone 
     * @returns {HRESULT} 
     */
    GetZone(pdwZone) {
        result := ComCall(25, this, "uint*", pdwZone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetProperties(pdwFlags) {
        result := ComCall(26, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} pUri 
     * @param {Pointer<BOOL>} pfEqual 
     * @returns {HRESULT} 
     */
    IsEqual(pUri, pfEqual) {
        result := ComCall(27, this, "ptr", pUri, "ptr", pfEqual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
