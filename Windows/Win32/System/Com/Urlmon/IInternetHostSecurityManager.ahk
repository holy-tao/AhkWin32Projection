#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetHostSecurityManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetHostSecurityManager
     * @type {Guid}
     */
    static IID => Guid("{3af280b6-cb3f-11d0-891e-00c04fb6bfc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecurityId", "ProcessUrlAction", "QueryCustomPolicy"]

    /**
     * 
     * @param {Pointer<Integer>} pbSecurityId 
     * @param {Pointer<Integer>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    GetSecurityId(pbSecurityId, pcbSecurityId, dwReserved) {
        result := ComCall(3, this, "char*", pbSecurityId, "uint*", pcbSecurityId, "ptr", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAction 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    ProcessUrlAction(dwAction, pPolicy, cbPolicy, pContext, cbContext, dwFlags, dwReserved) {
        result := ComCall(4, this, "uint", dwAction, "char*", pPolicy, "uint", cbPolicy, "char*", pContext, "uint", cbContext, "uint", dwFlags, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Pointer<Integer>>} ppPolicy 
     * @param {Pointer<Integer>} pcbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryCustomPolicy(guidKey, ppPolicy, pcbPolicy, pContext, cbContext, dwReserved) {
        result := ComCall(5, this, "ptr", guidKey, "ptr*", ppPolicy, "uint*", pcbPolicy, "char*", pContext, "uint", cbContext, "uint", dwReserved, "HRESULT")
        return result
    }
}
