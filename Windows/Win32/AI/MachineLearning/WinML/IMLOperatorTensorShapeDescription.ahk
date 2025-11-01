#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorTensorShapeDescription extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLOperatorTensorShapeDescription
     * @type {Guid}
     */
    static IID => Guid("{f20e8cbe-3b28-4248-be95-f96fbc6e4643}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputTensorDimensionCount", "GetInputTensorShape", "HasOutputShapeDescription", "GetOutputTensorDimensionCount", "GetOutputTensorShape"]

    /**
     * 
     * @param {Integer} inputIndex 
     * @param {Pointer<Integer>} dimensionCount 
     * @returns {HRESULT} 
     */
    GetInputTensorDimensionCount(inputIndex, dimensionCount) {
        result := ComCall(3, this, "uint", inputIndex, "uint*", dimensionCount, "HRESULT")
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
        result := ComCall(4, this, "uint", inputIndex, "uint", dimensionCount, "uint*", dimensions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    HasOutputShapeDescription() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @param {Pointer<Integer>} dimensionCount 
     * @returns {HRESULT} 
     */
    GetOutputTensorDimensionCount(outputIndex, dimensionCount) {
        result := ComCall(6, this, "uint", outputIndex, "uint*", dimensionCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @param {Integer} dimensionCount 
     * @param {Pointer<Integer>} dimensions 
     * @returns {HRESULT} 
     */
    GetOutputTensorShape(outputIndex, dimensionCount, dimensions) {
        result := ComCall(7, this, "uint", outputIndex, "uint", dimensionCount, "uint*", dimensions, "HRESULT")
        return result
    }
}
