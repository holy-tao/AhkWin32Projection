#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINML_MODEL_DESC.ahk" { WINML_MODEL_DESC }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WINML_VARIABLE_DESC.ahk" { WINML_VARIABLE_DESC }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a Windows Machine Learning model with corresponding metadata; includes model descriptions (name, author, versioning, etc.), as well as expected inputs and outputs.
 * @see https://learn.microsoft.com/windows/win32/api/winml/nn-winml-iwinmlmodel
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IWinMLModel extends IUnknown {
    /**
     * The interface identifier for IWinMLModel
     * @type {Guid}
     */
    static IID := Guid("{e2eeb6a9-f31f-4055-a521-e30b5b33664a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinMLModel interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDescription        : IntPtr
        EnumerateMetadata     : IntPtr
        EnumerateModelInputs  : IntPtr
        EnumerateModelOutputs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinMLModel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the WinML model description.
     * @returns {Pointer<WINML_MODEL_DESC>} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winml/ns-winml-winml_model_desc">WINML_MODEL_DESC</a> containing the model description.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-getdescription
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-enumeratemetadata
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
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-enumeratemodelinputs
     */
    EnumerateModelInputs(Index) {
        result := ComCall(5, this, "uint", Index, "ptr*", &ppInputDescriptor := 0, "HRESULT")
        return ppInputDescriptor
    }

    /**
     * Enumerates the WinML model outputs.
     * @param {Integer} Index Output index value.
     * @returns {Pointer<WINML_VARIABLE_DESC>} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winml/ns-winml-winml_variable_desc">WINML_VARIABLE_DESC</a> containing the model output description.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlmodel-enumeratemodeloutputs
     */
    EnumerateModelOutputs(Index) {
        result := ComCall(6, this, "uint", Index, "ptr*", &ppOutputDescriptor := 0, "HRESULT")
        return ppOutputDescriptor
    }

    Query(iid) {
        if (IWinMLModel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.EnumerateMetadata := CallbackCreate(GetMethod(implObj, "EnumerateMetadata"), flags, 4)
        this.vtbl.EnumerateModelInputs := CallbackCreate(GetMethod(implObj, "EnumerateModelInputs"), flags, 3)
        this.vtbl.EnumerateModelOutputs := CallbackCreate(GetMethod(implObj, "EnumerateModelOutputs"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.EnumerateMetadata)
        CallbackFree(this.vtbl.EnumerateModelInputs)
        CallbackFree(this.vtbl.EnumerateModelOutputs)
    }
}
