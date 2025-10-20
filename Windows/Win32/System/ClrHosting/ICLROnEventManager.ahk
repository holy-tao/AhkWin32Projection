#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLROnEventManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLROnEventManager
     * @type {Guid}
     */
    static IID => Guid("{1d0e0132-e64f-493d-9260-025c0e32c175}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterActionOnEvent", "UnregisterActionOnEvent"]

    /**
     * 
     * @param {Integer} event 
     * @param {IActionOnCLREvent} pAction 
     * @returns {HRESULT} 
     */
    RegisterActionOnEvent(event, pAction) {
        result := ComCall(3, this, "int", event, "ptr", pAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} event 
     * @param {IActionOnCLREvent} pAction 
     * @returns {HRESULT} 
     */
    UnregisterActionOnEvent(event, pAction) {
        result := ComCall(4, this, "int", event, "ptr", pAction, "HRESULT")
        return result
    }
}
