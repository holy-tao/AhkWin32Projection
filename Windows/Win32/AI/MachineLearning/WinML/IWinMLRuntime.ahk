#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents the runtime to load and evaluate a WinML model.
 * @see https://docs.microsoft.com/windows/win32/api//winml/nn-winml-iwinmlruntime
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
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<IWinMLModel>} ppModel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlruntime-loadmodel
     */
    LoadModel(Path, ppModel) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(3, this, "ptr", Path, "ptr*", ppModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Device} device 
     * @param {Pointer<IWinMLEvaluationContext>} ppContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlruntime-createevaluationcontext
     */
    CreateEvaluationContext(device, ppContext) {
        result := ComCall(4, this, "ptr", device, "ptr*", ppContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWinMLEvaluationContext} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlruntime-evaluatemodel
     */
    EvaluateModel(pContext) {
        result := ComCall(5, this, "ptr", pContext, "HRESULT")
        return result
    }
}
