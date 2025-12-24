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
     * Retrieves the WinML model description.
     * @returns {Pointer<WINML_MODEL_DESC>} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winml/ns-winml-winml_model_desc">WINML_MODEL_DESC</a> containing the model description.
     * @see https://docs.microsoft.com/windows/win32/api//winml/nf-winml-iwinmlmodel-getdescription
     */
    GetDescription() {
        result := ComCall(3, this, "ptr*", &ppDescription := 0, "HRESULT")
        return ppDescription
    }

    /**
     * Gets the metadata of the model.
     * @param {Integer} Index The metadata index value.
     * @param {Pointer<PWSTR>} pKey A pointer to the metadata key for the given index.
     * @param {Pointer<PWSTR>} pValue A pointer to the metadata value for the given index.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//winml/nf-winml-iwinmlmodel-enumeratemetadata
     */
    EnumerateMetadata(Index, pKey, pValue) {
        pKeyMarshal := pKey is VarRef ? "ptr*" : "ptr"
        pValueMarshal := pValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", Index, pKeyMarshal, pKey, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * Enumerates the WinML model inputs.
     * @param {Integer} Index Input index value.
     * @returns {Pointer<WINML_VARIABLE_DESC>} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winml/ns-winml-winml_variable_desc">WINML_VARIABLE_DESC</a> containing the model input description.
     * @see https://docs.microsoft.com/windows/win32/api//winml/nf-winml-iwinmlmodel-enumeratemodelinputs
     */
    EnumerateModelInputs(Index) {
        result := ComCall(5, this, "uint", Index, "ptr*", &ppInputDescriptor := 0, "HRESULT")
        return ppInputDescriptor
    }

    /**
     * Enumerates the WinML model outputs.
     * @param {Integer} Index Output index value.
     * @returns {Pointer<WINML_VARIABLE_DESC>} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winml/ns-winml-winml_variable_desc">WINML_VARIABLE_DESC</a> containing the model output description.
     * @see https://docs.microsoft.com/windows/win32/api//winml/nf-winml-iwinmlmodel-enumeratemodeloutputs
     */
    EnumerateModelOutputs(Index) {
        result := ComCall(6, this, "uint", Index, "ptr*", &ppOutputDescriptor := 0, "HRESULT")
        return ppOutputDescriptor
    }
}
