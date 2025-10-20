#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorTypeInferrer extends IUnknown{
    /**
     * The interface identifier for IMLOperatorTypeInferrer
     * @type {Guid}
     */
    static IID => Guid("{781aeb48-9bcb-4797-bf77-8bf455217beb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMLOperatorTypeInferenceContext>} context 
     * @returns {HRESULT} 
     */
    InferOutputTypes(context) {
        result := ComCall(3, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
