#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IWinMLModel.ahk
#Include .\IWinMLEvaluationContext.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents the runtime to load and evaluate a WinML model.
 * @see https://learn.microsoft.com/windows/win32/api//content/winml/nn-winml-iwinmlruntime
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IWinMLRuntime extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinMLRuntime
     * @type {Guid}
     */
    static IID => Guid("{a0425329-40ae-48d9-bce3-829ef7b8a41a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadModel", "CreateEvaluationContext", "EvaluateModel"]

    /**
     * Loads a WinML model.
     * @param {PWSTR} Path_ Path name for the model.
     * @returns {Pointer<IWinMLModel>} A double pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winml/nn-winml-iwinmlmodel">IWinMLModel</a> describing a WinML model.
     * @see https://learn.microsoft.com/windows/win32/api//content/winml/nf-winml-iwinmlruntime-loadmodel
     */
    LoadModel(Path_) {
        Path_ := Path_ is String ? StrPtr(Path_) : Path_

        result := ComCall(3, this, "ptr", Path_, "ptr*", &ppModel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppModel
    }

    /**
     * Creates a WinML evaluation context object.
     * @param {ID3D12Device} device A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a> describing a D3D12 device input.
     * @returns {Pointer<IWinMLEvaluationContext>} On success, returns a double pointer to the newly-created <a href="https://docs.microsoft.com/windows/desktop/api/winml/nn-winml-iwinmlevaluationcontext">WinMLEvaluationContext</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/winml/nf-winml-iwinmlruntime-createevaluationcontext
     */
    CreateEvaluationContext(device) {
        result := ComCall(4, this, "ptr", device, "ptr*", &ppContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppContext
    }

    /**
     * Evaluates a WinML model.
     * @param {IWinMLEvaluationContext} pContext A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winml/nn-winml-iwinmlevaluationcontext">WinMLEvaluationContext</a> to evaluate.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/winml/nf-winml-iwinmlruntime-evaluatemodel
     */
    EvaluateModel(pContext) {
        result := ComCall(5, this, "ptr", pContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
