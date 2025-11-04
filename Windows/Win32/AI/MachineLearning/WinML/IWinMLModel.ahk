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
     * @param {Pointer<Pointer<WINML_MODEL_DESC>>} ppDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-getdescription
     */
    GetDescription(ppDescription) {
        ppDescriptionMarshal := ppDescription is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppDescriptionMarshal, ppDescription, "HRESULT")
        return result
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
        result := ComCall(4, this, "uint", Index, "ptr", pKey, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Pointer<WINML_VARIABLE_DESC>>} ppInputDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-enumeratemodelinputs
     */
    EnumerateModelInputs(Index, ppInputDescriptor) {
        ppInputDescriptorMarshal := ppInputDescriptor is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", Index, ppInputDescriptorMarshal, ppInputDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Pointer<WINML_VARIABLE_DESC>>} ppOutputDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-enumeratemodeloutputs
     */
    EnumerateModelOutputs(Index, ppOutputDescriptor) {
        ppOutputDescriptorMarshal := ppOutputDescriptor is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", Index, ppOutputDescriptorMarshal, ppOutputDescriptor, "HRESULT")
        return result
    }
}
