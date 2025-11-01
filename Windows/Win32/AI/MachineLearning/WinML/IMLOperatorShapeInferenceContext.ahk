#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMLOperatorAttributes.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorShapeInferenceContext extends IMLOperatorAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLOperatorShapeInferenceContext
     * @type {Guid}
     */
    static IID => Guid("{105b6b29-5408-4a68-9959-09b5955a3492}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputCount", "GetOutputCount", "IsInputValid", "IsOutputValid", "GetInputEdgeDescription", "GetInputTensorDimensionCount", "GetInputTensorShape", "SetOutputTensorShape"]

    /**
     * 
     * @returns {Integer} 
     */
    GetInputCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOutputCount() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @returns {Boolean} 
     */
    IsInputValid(inputIndex) {
        result := ComCall(9, this, "uint", inputIndex, "int")
        return result
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @returns {Boolean} 
     */
    IsOutputValid(outputIndex) {
        result := ComCall(10, this, "uint", outputIndex, "int")
        return result
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @param {Pointer<MLOperatorEdgeDescription>} edgeDescription 
     * @returns {HRESULT} 
     */
    GetInputEdgeDescription(inputIndex, edgeDescription) {
        result := ComCall(11, this, "uint", inputIndex, "ptr", edgeDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @param {Pointer<Integer>} dimensionCount 
     * @returns {HRESULT} 
     */
    GetInputTensorDimensionCount(inputIndex, dimensionCount) {
        dimensionCountMarshal := dimensionCount is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", inputIndex, dimensionCountMarshal, dimensionCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @param {Integer} dimensionCount 
     * @param {Pointer<Integer>} dimensions 
     * @returns {HRESULT} 
     */
    GetInputTensorShape(inputIndex, dimensionCount, dimensions) {
        dimensionsMarshal := dimensions is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", inputIndex, "uint", dimensionCount, dimensionsMarshal, dimensions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @param {Integer} dimensionCount 
     * @param {Pointer<Integer>} dimensions 
     * @returns {HRESULT} 
     */
    SetOutputTensorShape(outputIndex, dimensionCount, dimensions) {
        dimensionsMarshal := dimensions is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", outputIndex, "uint", dimensionCount, dimensionsMarshal, dimensions, "HRESULT")
        return result
    }
}
