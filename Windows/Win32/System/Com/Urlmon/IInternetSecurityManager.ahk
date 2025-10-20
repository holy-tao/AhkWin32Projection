#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetSecurityManager extends IUnknown{
    /**
     * The interface identifier for IInternetSecurityManager
     * @type {Guid}
     */
    static IID => Guid("{79eac9ee-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IInternetSecurityMgrSite>} pSite 
     * @returns {HRESULT} 
     */
    SetSecuritySite(pSite) {
        result := ComCall(3, this, "ptr", pSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInternetSecurityMgrSite>} ppSite 
     * @returns {HRESULT} 
     */
    GetSecuritySite(ppSite) {
        result := ComCall(4, this, "ptr", ppSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<UInt32>} pdwZone 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    MapUrlToZone(pwszUrl, pdwZone, dwFlags) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(5, this, "ptr", pwszUrl, "uint*", pdwZone, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<Byte>} pbSecurityId 
     * @param {Pointer<UInt32>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    GetSecurityId(pwszUrl, pbSecurityId, pcbSecurityId, dwReserved) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(6, this, "ptr", pwszUrl, "char*", pbSecurityId, "uint*", pcbSecurityId, "ptr", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Integer} dwAction 
     * @param {Pointer<Byte>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Byte>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    ProcessUrlAction(pwszUrl, dwAction, pPolicy, cbPolicy, pContext, cbContext, dwFlags, dwReserved) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(7, this, "ptr", pwszUrl, "uint", dwAction, "char*", pPolicy, "uint", cbPolicy, "char*", pContext, "uint", cbContext, "uint", dwFlags, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Byte>} ppPolicy 
     * @param {Pointer<UInt32>} pcbPolicy 
     * @param {Pointer<Byte>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryCustomPolicy(pwszUrl, guidKey, ppPolicy, pcbPolicy, pContext, cbContext, dwReserved) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(8, this, "ptr", pwszUrl, "ptr", guidKey, "char*", ppPolicy, "uint*", pcbPolicy, "char*", pContext, "uint", cbContext, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {PWSTR} lpszPattern 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetZoneMapping(dwZone, lpszPattern, dwFlags) {
        lpszPattern := lpszPattern is String ? StrPtr(lpszPattern) : lpszPattern

        result := ComCall(9, this, "uint", dwZone, "ptr", lpszPattern, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<IEnumString>} ppenumString 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetZoneMappings(dwZone, ppenumString, dwFlags) {
        result := ComCall(10, this, "uint", dwZone, "ptr", ppenumString, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
