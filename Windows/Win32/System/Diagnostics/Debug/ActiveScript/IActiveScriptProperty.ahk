#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProperty extends IUnknown{
    /**
     * The interface identifier for IActiveScriptProperty
     * @type {Guid}
     */
    static IID => Guid("{4954e0d0-fbc7-11d1-8410-006008c3fbfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<VARIANT>} pvarIndex 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    GetProperty(dwProperty, pvarIndex, pvarValue) {
        result := ComCall(3, this, "uint", dwProperty, "ptr", pvarIndex, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<VARIANT>} pvarIndex 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    SetProperty(dwProperty, pvarIndex, pvarValue) {
        result := ComCall(4, this, "uint", dwProperty, "ptr", pvarIndex, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
