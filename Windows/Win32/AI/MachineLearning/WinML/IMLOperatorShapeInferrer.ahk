#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorShapeInferrer extends IUnknown{
    /**
     * The interface identifier for IMLOperatorShapeInferrer
     * @type {Guid}
     */
    static IID => Guid("{540be5be-a6c9-40ee-83f6-d2b8b40a7798}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMLOperatorShapeInferenceContext>} context 
     * @returns {HRESULT} 
     */
    InferOutputShapes(context) {
        result := ComCall(3, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
