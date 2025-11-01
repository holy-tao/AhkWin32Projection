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
        result := ComCall(12, this, "ptr", pUri, "uint*", pdwZone, "uint", dwFlags, "ptr", ppwszMappedUrl, "uint*", pdwOutFlags, "HRESULT")
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
        result := ComCall(13, this, "ptr", pUri, "uint", dwAction, "char*", pPolicy, "uint", cbPolicy, "char*", pContext, "uint", cbContext, "uint", dwFlags, "ptr", dwReserved, "uint*", pdwOutFlags, "HRESULT")
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
        result := ComCall(14, this, "ptr", pUri, "char*", pbSecurityId, "uint*", pcbSecurityId, "ptr", dwReserved, "HRESULT")
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
        result := ComCall(15, this, "ptr", pUri, "ptr", guidKey, "ptr*", ppPolicy, "uint*", pcbPolicy, "char*", pContext, "uint", cbContext, "ptr", dwReserved, "HRESULT")
        return result
    }
}
