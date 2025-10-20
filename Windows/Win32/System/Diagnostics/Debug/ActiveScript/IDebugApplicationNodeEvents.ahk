#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationNodeEvents extends IUnknown{
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
     * 
     * @param {Pointer<IDebugApplicationNode>} prddpChild 
     * @returns {HRESULT} 
     */
    onAddChild(prddpChild) {
        result := ComCall(3, this, "ptr", prddpChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplicationNode>} prddpChild 
     * @returns {HRESULT} 
     */
    onRemoveChild(prddpChild) {
        result := ComCall(4, this, "ptr", prddpChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    onDetach() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplicationNode>} prddpParent 
     * @returns {HRESULT} 
     */
    onAttach(prddpParent) {
        result := ComCall(6, this, "ptr", prddpParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
