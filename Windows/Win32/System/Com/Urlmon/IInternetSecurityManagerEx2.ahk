#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetSecurityManagerEx.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetSecurityManagerEx2 extends IInternetSecurityManagerEx{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetSecurityManagerEx2
     * @type {Guid}
     */
    static IID => Guid("{f1e50292-a795-4117-8e09-2b560a72ac60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MapUrlToZoneEx2", "ProcessUrlActionEx2", "GetSecurityIdEx2", "QueryCustomPolicyEx2"]

    /**
     * 
     * @param {IUri} pUri 
     * @param {Pointer<Integer>} pdwZone 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} ppwszMappedUrl 
     * @param {Pointer<Integer>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    MapUrlToZoneEx2(pUri, pdwZone, dwFlags, ppwszMappedUrl, pdwOutFlags) {
        pdwZoneMarshal := pdwZone is VarRef ? "uint*" : "ptr"
        pdwOutFlagsMarshal := pdwOutFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pUri, pdwZoneMarshal, pdwZone, "uint", dwFlags, "ptr", ppwszMappedUrl, pdwOutFlagsMarshal, pdwOutFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUri} pUri 
     * @param {Integer} dwAction 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwReserved 
     * @param {Pointer<Integer>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    ProcessUrlActionEx2(pUri, dwAction, pPolicy, cbPolicy, pContext, cbContext, dwFlags, dwReserved, pdwOutFlags) {
        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"
        pdwOutFlagsMarshal := pdwOutFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pUri, "uint", dwAction, pPolicyMarshal, pPolicy, "uint", cbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwFlags, "ptr", dwReserved, pdwOutFlagsMarshal, pdwOutFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUri} pUri 
     * @param {Pointer<Integer>} pbSecurityId 
     * @param {Pointer<Integer>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    GetSecurityIdEx2(pUri, pbSecurityId, pcbSecurityId, dwReserved) {
        pbSecurityIdMarshal := pbSecurityId is VarRef ? "char*" : "ptr"
        pcbSecurityIdMarshal := pcbSecurityId is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", pUri, pbSecurityIdMarshal, pbSecurityId, pcbSecurityIdMarshal, pcbSecurityId, "ptr", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUri} pUri 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Pointer<Integer>>} ppPolicy 
     * @param {Pointer<Integer>} pcbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryCustomPolicyEx2(pUri, guidKey, ppPolicy, pcbPolicy, pContext, cbContext, dwReserved) {
        ppPolicyMarshal := ppPolicy is VarRef ? "ptr*" : "ptr"
        pcbPolicyMarshal := pcbPolicy is VarRef ? "uint*" : "ptr"
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, "ptr", pUri, "ptr", guidKey, ppPolicyMarshal, ppPolicy, pcbPolicyMarshal, pcbPolicy, pContextMarshal, pContext, "uint", cbContext, "ptr", dwReserved, "HRESULT")
        return result
    }
}
