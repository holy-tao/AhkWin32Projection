#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetSecurityMgrSite.ahk
#Include ..\IEnumString.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetSecurityManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSecuritySite", "GetSecuritySite", "MapUrlToZone", "GetSecurityId", "ProcessUrlAction", "QueryCustomPolicy", "SetZoneMapping", "GetZoneMappings"]

    /**
     * 
     * @param {IInternetSecurityMgrSite} pSite 
     * @returns {HRESULT} 
     */
    SetSecuritySite(pSite) {
        result := ComCall(3, this, "ptr", pSite, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInternetSecurityMgrSite} 
     */
    GetSecuritySite() {
        result := ComCall(4, this, "ptr*", &ppSite := 0, "HRESULT")
        return IInternetSecurityMgrSite(ppSite)
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    MapUrlToZone(pwszUrl, dwFlags) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(5, this, "ptr", pwszUrl, "uint*", &pdwZone := 0, "uint", dwFlags, "HRESULT")
        return pdwZone
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<Integer>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {Integer} 
     */
    GetSecurityId(pwszUrl, pcbSecurityId, dwReserved) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        pcbSecurityIdMarshal := pcbSecurityId is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwszUrl, "char*", &pbSecurityId := 0, pcbSecurityIdMarshal, pcbSecurityId, "ptr", dwReserved, "HRESULT")
        return pbSecurityId
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Integer} dwAction 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    ProcessUrlAction(pwszUrl, dwAction, cbPolicy, pContext, cbContext, dwFlags, dwReserved) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        pContextMarshal := pContext is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pwszUrl, "uint", dwAction, "char*", &pPolicy := 0, "uint", cbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwFlags, "uint", dwReserved, "HRESULT")
        return pPolicy
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Pointer<Integer>>} ppPolicy 
     * @param {Pointer<Integer>} pcbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryCustomPolicy(pwszUrl, guidKey, ppPolicy, pcbPolicy, pContext, cbContext, dwReserved) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        ppPolicyMarshal := ppPolicy is VarRef ? "ptr*" : "ptr"
        pcbPolicyMarshal := pcbPolicy is VarRef ? "uint*" : "ptr"
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "ptr", pwszUrl, "ptr", guidKey, ppPolicyMarshal, ppPolicy, pcbPolicyMarshal, pcbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwReserved, "HRESULT")
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

        result := ComCall(9, this, "uint", dwZone, "ptr", lpszPattern, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwFlags 
     * @returns {IEnumString} 
     */
    GetZoneMappings(dwZone, dwFlags) {
        result := ComCall(10, this, "uint", dwZone, "ptr*", &ppenumString := 0, "uint", dwFlags, "HRESULT")
        return IEnumString(ppenumString)
    }
}
