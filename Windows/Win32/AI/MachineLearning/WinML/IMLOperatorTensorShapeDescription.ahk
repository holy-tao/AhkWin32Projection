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
     * @returns {Integer} 
     */
    GetInputTensorDimensionCount(inputIndex) {
        result := ComCall(3, this, "uint", inputIndex, "uint*", &dimensionCount := 0, "HRESULT")
        return dimensionCount
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @param {Integer} dimensionCount 
     * @returns {Integer} 
     */
    GetInputTensorShape(inputIndex, dimensionCount) {
        result := ComCall(4, this, "uint", inputIndex, "uint", dimensionCount, "uint*", &dimensions := 0, "HRESULT")
        return dimensions
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
     * @returns {Integer} 
     */
    GetOutputTensorDimensionCount(outputIndex) {
        result := ComCall(6, this, "uint", outputIndex, "uint*", &dimensionCount := 0, "HRESULT")
        return dimensionCount
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @param {Integer} dimensionCount 
     * @returns {Integer} 
     */
    GetOutputTensorShape(outputIndex, dimensionCount) {
        result := ComCall(7, this, "uint", outputIndex, "uint", dimensionCount, "uint*", &dimensions := 0, "HRESULT")
        return dimensions
    }
}
