#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMLOperatorTensor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorKernelContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLOperatorKernelContext
     * @type {Guid}
     */
    static IID => Guid("{82536a28-f022-4769-9d3f-8b278f84c0c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputTensor", "GetOutputTensor", "GetOutputTensor1", "AllocateTemporaryData", "GetExecutionInterface"]

    /**
     * 
     * @param {Integer} inputIndex 
     * @returns {IMLOperatorTensor} 
     */
    GetInputTensor(inputIndex) {
        result := ComCall(3, this, "uint", inputIndex, "ptr*", &tensor := 0, "HRESULT")
        return IMLOperatorTensor(tensor)
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @param {Integer} dimensionCount 
     * @param {Pointer<Integer>} dimensionSizes 
     * @returns {IMLOperatorTensor} 
     */
    GetOutputTensor(outputIndex, dimensionCount, dimensionSizes) {
        dimensionSizesMarshal := dimensionSizes is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", outputIndex, "uint", dimensionCount, dimensionSizesMarshal, dimensionSizes, "ptr*", &tensor := 0, "HRESULT")
        return IMLOperatorTensor(tensor)
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @returns {IMLOperatorTensor} 
     */
    GetOutputTensor1(outputIndex) {
        result := ComCall(5, this, "uint", outputIndex, "ptr*", &tensor := 0, "HRESULT")
        return IMLOperatorTensor(tensor)
    }

    /**
     * 
     * @param {Pointer} size 
     * @returns {IUnknown} 
     */
    AllocateTemporaryData(size) {
        result := ComCall(6, this, "ptr", size, "ptr*", &data := 0, "HRESULT")
        return IUnknown(data)
    }

    /**
     * 
     * @param {Pointer<IUnknown>} executionObject 
     * @returns {String} Nothing - always returns an empty string
     */
    GetExecutionInterface(executionObject) {
        ComCall(7, this, "ptr*", executionObject)
    }
}
