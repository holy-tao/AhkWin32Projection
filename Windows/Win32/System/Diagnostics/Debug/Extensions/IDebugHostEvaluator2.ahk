#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostEvaluator.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostEvaluator2 extends IDebugHostEvaluator{
    /**
     * The interface identifier for IDebugHostEvaluator2
     * @type {Guid}
     */
    static IID => Guid("{a117a435-1fb4-4092-a2ab-a929576c1e87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<IModelObject>} assignmentReference 
     * @param {Pointer<IModelObject>} assignmentValue 
     * @param {Pointer<IModelObject>} assignmentResult 
     * @param {Pointer<IKeyStore>} assignmentMetadata 
     * @returns {HRESULT} 
     */
    AssignTo(assignmentReference, assignmentValue, assignmentResult, assignmentMetadata) {
        result := ComCall(5, this, "ptr", assignmentReference, "ptr", assignmentValue, "ptr", assignmentResult, "ptr", assignmentMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
