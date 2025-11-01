#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class AsyncIDebugApplicationNodeEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIDebugApplicationNodeEvents
     * @type {Guid}
     */
    static IID => Guid("{a2e3aa3b-aa8d-4ebf-84cd-648b737b8c13}")

    /**
     * The class identifier for AsyncIDebugApplicationNodeEvents
     * @type {Guid}
     */
    static CLSID => Guid("{a2e3aa3b-aa8d-4ebf-84cd-648b737b8c13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_onAddChild", "Finish_onAddChild", "Begin_onRemoveChild", "Finish_onRemoveChild", "Begin_onDetach", "Finish_onDetach", "Begin_onAttach", "Finish_onAttach"]

    /**
     * 
     * @param {IDebugApplicationNode} prddpChild 
     * @returns {HRESULT} 
     */
    Begin_onAddChild(prddpChild) {
        result := ComCall(3, this, "ptr", prddpChild, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_onAddChild() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpChild 
     * @returns {HRESULT} 
     */
    Begin_onRemoveChild(prddpChild) {
        result := ComCall(5, this, "ptr", prddpChild, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_onRemoveChild() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_onDetach() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_onDetach() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpParent 
     * @returns {HRESULT} 
     */
    Begin_onAttach(prddpParent) {
        result := ComCall(9, this, "ptr", prddpParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_onAttach() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
