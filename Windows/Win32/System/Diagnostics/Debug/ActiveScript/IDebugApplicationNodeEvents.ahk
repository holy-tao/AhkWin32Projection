#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationNodeEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplicationNodeEvents
     * @type {Guid}
     */
    static IID => Guid("{51973c35-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["onAddChild", "onRemoveChild", "onDetach", "onAttach"]

    /**
     * 
     * @param {IDebugApplicationNode} prddpChild 
     * @returns {HRESULT} 
     */
    onAddChild(prddpChild) {
        result := ComCall(3, this, "ptr", prddpChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpChild 
     * @returns {HRESULT} 
     */
    onRemoveChild(prddpChild) {
        result := ComCall(4, this, "ptr", prddpChild, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    onDetach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} prddpParent 
     * @returns {HRESULT} 
     */
    onAttach(prddpParent) {
        result := ComCall(6, this, "ptr", prddpParent, "HRESULT")
        return result
    }
}
