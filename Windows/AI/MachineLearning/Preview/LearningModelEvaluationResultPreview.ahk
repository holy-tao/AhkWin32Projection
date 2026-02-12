#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILearningModelEvaluationResultPreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Gets the set of output predictions and corresponding probabilities correlated to the model evaluation.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelevaluationresultpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class LearningModelEvaluationResultPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelEvaluationResultPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelEvaluationResultPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets the value to correlate the output results with the evaluation call.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelevaluationresultpreview.correlationid
     * @type {HSTRING} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
    }

    /**
     * **Deprecated.** Gets the set of features representing the output prediction along with probabilities.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * 
     * If the output feature was unbound, then the call to EvaluateAsync created these values.
     * Otherwise, these features are references to the values created earlier.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelevaluationresultpreview.outputs
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Outputs {
        get => this.get_Outputs()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CorrelationId() {
        if (!this.HasProp("__ILearningModelEvaluationResultPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelEvaluationResultPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelEvaluationResultPreview := ILearningModelEvaluationResultPreview(outPtr)
        }

        return this.__ILearningModelEvaluationResultPreview.get_CorrelationId()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Outputs() {
        if (!this.HasProp("__ILearningModelEvaluationResultPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelEvaluationResultPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelEvaluationResultPreview := ILearningModelEvaluationResultPreview(outPtr)
        }

        return this.__ILearningModelEvaluationResultPreview.get_Outputs()
    }

;@endregion Instance Methods
}
