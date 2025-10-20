#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMLOperatorAttributes.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorTypeInferenceContext extends IMLOperatorAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLOperatorTypeInferenceContext
     * @type {Guid}
     */
    static IID => Guid("{ec893bb1-f938-427b-8488-c8dcf775f138}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputCount", "GetOutputCount", "IsInputValid", "IsOutputValid", "GetInputEdgeDescription", "SetOutputEdgeDescription"]

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
     * @param {Integer} outputIndex 
     * @param {Pointer<MLOperatorEdgeDescription>} edgeDescription 
     * @returns {HRESULT} 
     */
    SetOutputEdgeDescription(outputIndex, edgeDescription) {
        result := ComCall(12, this, "uint", outputIndex, "ptr", edgeDescription, "HRESULT")
        return result
    }
}
