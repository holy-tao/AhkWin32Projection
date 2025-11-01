#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IProcessDebugManager32 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessDebugManager32
     * @type {Guid}
     */
    static IID => Guid("{51973c2f-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateApplication", "GetDefaultApplication", "AddApplication", "RemoveApplication", "CreateDebugDocumentHelper"]

    /**
     * 
     * @param {Pointer<IDebugApplication32>} ppda 
     * @returns {HRESULT} 
     */
    CreateApplication(ppda) {
        result := ComCall(3, this, "ptr*", ppda, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplication32>} ppda 
     * @returns {HRESULT} 
     */
    GetDefaultApplication(ppda) {
        result := ComCall(4, this, "ptr*", ppda, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplication32} pda 
     * @param {Pointer<Integer>} pdwAppCookie 
     * @returns {HRESULT} 
     */
    AddApplication(pda, pdwAppCookie) {
        pdwAppCookieMarshal := pdwAppCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pda, pdwAppCookieMarshal, pdwAppCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAppCookie 
     * @returns {HRESULT} 
     */
    RemoveApplication(dwAppCookie) {
        result := ComCall(6, this, "uint", dwAppCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkOuter 
     * @param {Pointer<IDebugDocumentHelper32>} pddh 
     * @returns {HRESULT} 
     */
    CreateDebugDocumentHelper(punkOuter, pddh) {
        result := ComCall(7, this, "ptr", punkOuter, "ptr*", pddh, "HRESULT")
        return result
    }
}
