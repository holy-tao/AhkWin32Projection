#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IActiveIMMMessagePumpOwner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveIMMMessagePumpOwner
     * @type {Guid}
     */
    static IID => Guid("{b5cf2cfa-8aeb-11d1-9364-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "End", "OnTranslateMessage", "Pause", "Resume"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    End() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @returns {HRESULT} 
     */
    OnTranslateMessage(pMsg) {
        result := ComCall(5, this, "ptr", pMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     */
    Pause(pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Resume(dwCookie) {
        result := ComCall(7, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
