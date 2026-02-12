#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILearningModelEvaluationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Get the results of the evaluation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelevaluationresult
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class LearningModelEvaluationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelEvaluationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelEvaluationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The optional string that was passed to [LearningModelSession.Evaluate](learningmodelsession_evaluate_291797498.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelevaluationresult.correlationid
     * @type {HSTRING} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * If the evaluation failed, returns an error code for what caused the failure.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelevaluationresult.errorstatus
     * @type {Integer} 
     */
    ErrorStatus {
        get => this.get_ErrorStatus()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * True if the evaluation completed successfully; otherwise, false.
     * @remarks
     * If false, use [LearningModelEvaluationResult.ErrorStatus](learningmodelevaluationresult_errorstatus.md) to find out what caused the failure.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelevaluationresult.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Gets the output features of the model.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelevaluationresult.outputs
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
        if (!this.HasProp("__ILearningModelEvaluationResult")) {
            if ((queryResult := this.QueryInterface(ILearningModelEvaluationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelEvaluationResult := ILearningModelEvaluationResult(outPtr)
        }

        return this.__ILearningModelEvaluationResult.get_CorrelationId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorStatus() {
        if (!this.HasProp("__ILearningModelEvaluationResult")) {
            if ((queryResult := this.QueryInterface(ILearningModelEvaluationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelEvaluationResult := ILearningModelEvaluationResult(outPtr)
        }

        return this.__ILearningModelEvaluationResult.get_ErrorStatus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__ILearningModelEvaluationResult")) {
            if ((queryResult := this.QueryInterface(ILearningModelEvaluationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelEvaluationResult := ILearningModelEvaluationResult(outPtr)
        }

        return this.__ILearningModelEvaluationResult.get_Succeeded()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Outputs() {
        if (!this.HasProp("__ILearningModelEvaluationResult")) {
            if ((queryResult := this.QueryInterface(ILearningModelEvaluationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelEvaluationResult := ILearningModelEvaluationResult(outPtr)
        }

        return this.__ILearningModelEvaluationResult.get_Outputs()
    }

;@endregion Instance Methods
}
