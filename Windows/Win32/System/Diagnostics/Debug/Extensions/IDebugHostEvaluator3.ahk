#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk
#Include .\IDebugHostEvaluator2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostEvaluator3 extends IDebugHostEvaluator2{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compare"]

    /**
     * 
     * @param {IModelObject} pLeft 
     * @param {IModelObject} pRight 
     * @returns {IModelObject} 
     */
    Compare(pLeft, pRight) {
        result := ComCall(6, this, "ptr", pLeft, "ptr", pRight, "ptr*", &ppResult := 0, "HRESULT")
        return IModelObject(ppResult)
    }
}
