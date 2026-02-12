#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\LearningModelEvaluationResultPreview.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\LearningModelDescriptionPreview.ahk
#Include .\InferencingOptionsPreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class ILearningModelPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelPreview
     * @type {Guid}
     */
    static IID => Guid("{049c266a-93b4-478c-aeb8-70157bf0ff94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EvaluateAsync", "EvaluateFeaturesAsync", "get_Description", "get_InferencingOptions", "put_InferencingOptions"]

    /**
     * @type {LearningModelDescriptionPreview} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {InferencingOptionsPreview} 
     */
    InferencingOptions {
        get => this.get_InferencingOptions()
        set => this.put_InferencingOptions(value)
    }

    /**
     * 
     * @param {LearningModelBindingPreview} binding_ 
     * @param {HSTRING} correlationId_ 
     * @returns {IAsyncOperation<LearningModelEvaluationResultPreview>} 
     */
    EvaluateAsync(binding_, correlationId_) {
        if(correlationId_ is String) {
            pin := HSTRING.Create(correlationId_)
            correlationId_ := pin.Value
        }
        correlationId_ := correlationId_ is Win32Handle ? NumGet(correlationId_, "ptr") : correlationId_

        result := ComCall(6, this, "ptr", binding_, "ptr", correlationId_, "ptr*", &evalOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModelEvaluationResultPreview, evalOperation)
    }

    /**
     * 
     * @param {IMap<HSTRING, IInspectable>} features 
     * @param {HSTRING} correlationId_ 
     * @returns {IAsyncOperation<LearningModelEvaluationResultPreview>} 
     */
    EvaluateFeaturesAsync(features, correlationId_) {
        if(correlationId_ is String) {
            pin := HSTRING.Create(correlationId_)
            correlationId_ := pin.Value
        }
        correlationId_ := correlationId_ is Win32Handle ? NumGet(correlationId_, "ptr") : correlationId_

        result := ComCall(7, this, "ptr", features, "ptr", correlationId_, "ptr*", &evalOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModelEvaluationResultPreview, evalOperation)
    }

    /**
     * 
     * @returns {LearningModelDescriptionPreview} 
     */
    get_Description() {
        result := ComCall(8, this, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelDescriptionPreview(returnValue)
    }

    /**
     * 
     * @returns {InferencingOptionsPreview} 
     */
    get_InferencingOptions() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InferencingOptionsPreview(value)
    }

    /**
     * 
     * @param {InferencingOptionsPreview} value 
     * @returns {HRESULT} 
     */
    put_InferencingOptions(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
