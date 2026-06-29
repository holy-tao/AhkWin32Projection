#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWinMLModel.ahk" { IWinMLModel }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Graphics\Direct3D12\ID3D12Device.ahk" { ID3D12Device }
#Import ".\IWinMLEvaluationContext.ahk" { IWinMLEvaluationContext }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the runtime to load and evaluate a WinML model.
 * @see https://learn.microsoft.com/windows/win32/api/winml/nn-winml-iwinmlruntime
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IWinMLRuntime extends IUnknown {
    /**
     * The interface identifier for IWinMLRuntime
     * @type {Guid}
     */
    static IID := Guid("{a0425329-40ae-48d9-bce3-829ef7b8a41a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinMLRuntime interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LoadModel               : IntPtr
        CreateEvaluationContext : IntPtr
        EvaluateModel           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinMLRuntime.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Loads a WinML model.
     * @param {PWSTR} _Path Path name for the model.
     * @returns {IWinMLModel} A double pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winml/nn-winml-iwinmlmodel">IWinMLModel</a> describing a WinML model.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlruntime-loadmodel
     */
    LoadModel(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(3, this, "ptr", _Path, "ptr*", &ppModel := 0, "HRESULT")
        return IWinMLModel(ppModel)
    }

    /**
     * Creates a WinML evaluation context object.
     * @param {ID3D12Device} device A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a> describing a D3D12 device input.
     * @returns {IWinMLEvaluationContext} On success, returns a double pointer to the newly-created <a href="https://docs.microsoft.com/windows/desktop/api/winml/nn-winml-iwinmlevaluationcontext">WinMLEvaluationContext</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlruntime-createevaluationcontext
     */
    CreateEvaluationContext(device) {
        result := ComCall(4, this, "ptr", device, "ptr*", &ppContext := 0, "HRESULT")
        return IWinMLEvaluationContext(ppContext)
    }

    /**
     * Evaluates a WinML model.
     * @param {IWinMLEvaluationContext} pContext A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winml/nn-winml-iwinmlevaluationcontext">WinMLEvaluationContext</a> to evaluate.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlruntime-evaluatemodel
     */
    EvaluateModel(pContext) {
        result := ComCall(5, this, "ptr", pContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWinMLRuntime.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadModel := CallbackCreate(GetMethod(implObj, "LoadModel"), flags, 3)
        this.vtbl.CreateEvaluationContext := CallbackCreate(GetMethod(implObj, "CreateEvaluationContext"), flags, 3)
        this.vtbl.EvaluateModel := CallbackCreate(GetMethod(implObj, "EvaluateModel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadModel)
        CallbackFree(this.vtbl.CreateEvaluationContext)
        CallbackFree(this.vtbl.EvaluateModel)
    }
}
