#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IUri>} ppIUri 
     * @returns {HRESULT} 
     */
    CreateUriSimple(dwAllowEncodingPropertyMask, dwReserved, ppIUri) {
        result := ComCall(3, this, "uint", dwAllowEncodingPropertyMask, "ptr", dwReserved, "ptr*", ppIUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCreateFlags 
     * @param {Integer} dwAllowEncodingPropertyMask 
     * @param {Pointer} dwReserved 
     * @param {Pointer<IUri>} ppIUri 
     * @returns {HRESULT} 
     */
    CreateUri(dwCreateFlags, dwAllowEncodingPropertyMask, dwReserved, ppIUri) {
        result := ComCall(4, this, "uint", dwCreateFlags, "uint", dwAllowEncodingPropertyMask, "ptr", dwReserved, "ptr*", ppIUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCreateFlags 
     * @param {Integer} dwUriBuilderFlags 
     * @param {Integer} dwAllowEncodingPropertyMask 
     * @param {Pointer} dwReserved 
     * @param {Pointer<IUri>} ppIUri 
     * @returns {HRESULT} 
     */
    CreateUriWithFlags(dwCreateFlags, dwUriBuilderFlags, dwAllowEncodingPropertyMask, dwReserved, ppIUri) {
        result := ComCall(5, this, "uint", dwCreateFlags, "uint", dwUriBuilderFlags, "uint", dwAllowEncodingPropertyMask, "ptr", dwReserved, "ptr*", ppIUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} ppIUri 
     * @returns {HRESULT} 
     */
    GetIUri(ppIUri) {
        result := ComCall(6, this, "ptr*", ppIUri, "HRESULT")
        return result
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

        result := ComCall(8, this, pcchFragmentMarshal, pcchFragment, "ptr", ppwzFragment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchHost 
     * @param {Pointer<PWSTR>} ppwzHost 
     * @returns {HRESULT} 
     */
    GetHost(pcchHost, ppwzHost) {
        pcchHostMarshal := pcchHost is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pcchHostMarshal, pcchHost, "ptr", ppwzHost, "HRESULT")
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

        result := ComCall(10, this, pcchPasswordMarshal, pcchPassword, "ptr", ppwzPassword, "HRESULT")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<Integer>} pcchPath 
     * @param {Pointer<PWSTR>} ppwzPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pcchPath, ppwzPath) {
        pcchPathMarshal := pcchPath is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pcchPathMarshal, pcchPath, "ptr", ppwzPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasPort 
     * @param {Pointer<Integer>} pdwPort 
     * @returns {HRESULT} 
     */
    GetPort(pfHasPort, pdwPort) {
        pdwPortMarshal := pdwPort is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pfHasPort, pdwPortMarshal, pdwPort, "HRESULT")
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

        result := ComCall(13, this, pcchQueryMarshal, pcchQuery, "ptr", ppwzQuery, "HRESULT")
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

        result := ComCall(14, this, pcchSchemeNameMarshal, pcchSchemeName, "ptr", ppwzSchemeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchUserName 
     * @param {Pointer<PWSTR>} ppwzUserName 
     * @returns {HRESULT} 
     */
    GetUserName(pcchUserName, ppwzUserName) {
        pcchUserNameMarshal := pcchUserName is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, pcchUserNameMarshal, pcchUserName, "ptr", ppwzUserName, "HRESULT")
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
     * 
     * @param {BOOL} fHasPort 
     * @param {Integer} dwNewValue 
     * @returns {HRESULT} 
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
     * @param {Pointer<BOOL>} pfModified 
     * @returns {HRESULT} 
     */
    HasBeenModified(pfModified) {
        result := ComCall(25, this, "ptr", pfModified, "HRESULT")
        return result
    }
}
