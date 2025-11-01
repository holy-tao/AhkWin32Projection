#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IProcessDebugManager64 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessDebugManager64
     * @type {Guid}
     */
    static IID => Guid("{56b9fc1c-63a9-4cc1-ac21-087d69a17fab}")

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
     * @param {Pointer<IDebugApplication64>} ppda 
     * @returns {HRESULT} 
     */
    CreateApplication(ppda) {
        result := ComCall(3, this, "ptr*", ppda, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplication64>} ppda 
     * @returns {HRESULT} 
     */
    GetDefaultApplication(ppda) {
        result := ComCall(4, this, "ptr*", ppda, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplication64} pda 
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
     * @param {Pointer<IDebugDocumentHelper64>} pddh 
     * @returns {HRESULT} 
     */
    CreateDebugDocumentHelper(punkOuter, pddh) {
        result := ComCall(7, this, "ptr", punkOuter, "ptr*", pddh, "HRESULT")
        return result
    }
}
