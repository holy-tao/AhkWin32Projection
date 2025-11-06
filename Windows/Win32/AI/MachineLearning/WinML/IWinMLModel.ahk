#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a Windows Machine Learning model with corresponding metadata; includes model descriptions (name, author, versioning, etc.), as well as expected inputs and outputs.
 * @see https://docs.microsoft.com/windows/win32/api//winml/nn-winml-iwinmlmodel
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IWinMLModel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinMLModel
     * @type {Guid}
     */
    static IID => Guid("{e2eeb6a9-f31f-4055-a521-e30b5b33664a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDescription", "EnumerateMetadata", "EnumerateModelInputs", "EnumerateModelOutputs"]

    /**
     * 
     * @returns {Pointer<WINML_MODEL_DESC>} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-getdescription
     */
    GetDescription() {
        result := ComCall(3, this, "ptr*", &ppDescription := 0, "HRESULT")
        return ppDescription
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<PWSTR>} pKey 
     * @param {Pointer<PWSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-enumeratemetadata
     */
    EnumerateMetadata(Index, pKey, pValue) {
        pKeyMarshal := pKey is VarRef ? "ptr*" : "ptr"
        pValueMarshal := pValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", Index, pKeyMarshal, pKey, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Pointer<WINML_VARIABLE_DESC>} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-enumeratemodelinputs
     */
    EnumerateModelInputs(Index) {
        result := ComCall(5, this, "uint", Index, "ptr*", &ppInputDescriptor := 0, "HRESULT")
        return ppInputDescriptor
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Pointer<WINML_VARIABLE_DESC>} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-enumeratemodeloutputs
     */
    EnumerateModelOutputs(Index) {
        result := ComCall(6, this, "uint", Index, "ptr*", &ppOutputDescriptor := 0, "HRESULT")
        return ppOutputDescriptor
    }
}
