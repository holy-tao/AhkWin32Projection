#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostEvaluator2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostEvaluator3 extends IDebugHostEvaluator2{
    /**
     * The interface identifier for IDebugHostEvaluator3
     * @type {Guid}
     */
    static IID => Guid("{d2419f4a-7e8d-4c15-a499-73902b015abb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<IModelObject>} pLeft 
     * @param {Pointer<IModelObject>} pRight 
     * @param {Pointer<IModelObject>} ppResult 
     * @returns {HRESULT} 
     */
    Compare(pLeft, pRight, ppResult) {
        result := ComCall(6, this, "ptr", pLeft, "ptr", pRight, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
