#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILearningModelSessionOptions.ahk
#Include .\ILearningModelSessionOptions2.ahk
#Include .\ILearningModelSessionOptions3.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Describes inference options that are used during the creation of [LearningModelSession](learningmodelsession.md) objects.
 * @remarks
 * The **LearningModelSessionOptions** object can be used to configure [LearningModelSession](learningmodelsession.md) construction.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsessionoptions
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class LearningModelSessionOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelSessionOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelSessionOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * A numeric value that specifies a constant batch size override value for the target model.
     * @remarks
     * The **BatchSizeOverride** option allows the model compiler to use constant batch size performance optimizations when setting up the [LearningModelSession](learningmodelsession.md).
     * 
     * By setting the **BatchSizeOverride** options, all inputs for the session will have their batch sizes restricted to match the specified **BatchSizeOverride** value.
     * 
     * A **BatchSizeOverride** = 0 indicates that the batch size present in the model should be honored without change.
     * 
     * **BatchSizeOverride** > 0 indicates the batch size that will be used to override the model batch size and optimize evaluations.
     * 
     * If model evaluations always happen using the same batch size, performance can be improved by setting the **BatchSizeOverride** to the expected batch size.
     * 
     * Setting the **BatchSizeOverride** parameter will restrict the model's input batch size to a constant batch size, and will enable model compiler optimizations that can improve the runtime performance of calls to [Evaluate](learningmodelsession_evaluate_291797498.md).
     * 
     * If the inference model is designed to accept any batch size, then the **BatchSizeOverride** parameter can be used to restrict batched inputs to a constant batch size.
     * 
     * However, if the inference model is designed with a constant batch size, the **BatchSizeOverride** parameter must match the constant batch size defined in the model.
     * 
     * ONNX models describe the batch dimension of input tensor features using the DATA_BATCH dimension denotation. This corresponds to the N dimension in the more commonly used tensor format notation NCHW.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsessionoptions.batchsizeoverride
     * @type {Integer} 
     */
    BatchSizeOverride {
        get => this.get_BatchSizeOverride()
        set => this.put_BatchSizeOverride(value)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Specifies whether a [LearningModelSession](learningmodelsession.md) should close the associated learning model when it is created.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsessionoptions.closemodelonsessioncreation
     * @type {Boolean} 
     */
    CloseModelOnSessionCreation {
        get => this.get_CloseModelOnSessionCreation()
        set => this.put_CloseModelOnSessionCreation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates options to configure the creation of a [LearningModelSession](learningmodelsession.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModelSessionOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BatchSizeOverride() {
        if (!this.HasProp("__ILearningModelSessionOptions")) {
            if ((queryResult := this.QueryInterface(ILearningModelSessionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSessionOptions := ILearningModelSessionOptions(outPtr)
        }

        return this.__ILearningModelSessionOptions.get_BatchSizeOverride()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BatchSizeOverride(value) {
        if (!this.HasProp("__ILearningModelSessionOptions")) {
            if ((queryResult := this.QueryInterface(ILearningModelSessionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSessionOptions := ILearningModelSessionOptions(outPtr)
        }

        return this.__ILearningModelSessionOptions.put_BatchSizeOverride(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CloseModelOnSessionCreation() {
        if (!this.HasProp("__ILearningModelSessionOptions2")) {
            if ((queryResult := this.QueryInterface(ILearningModelSessionOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSessionOptions2 := ILearningModelSessionOptions2(outPtr)
        }

        return this.__ILearningModelSessionOptions2.get_CloseModelOnSessionCreation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CloseModelOnSessionCreation(value) {
        if (!this.HasProp("__ILearningModelSessionOptions2")) {
            if ((queryResult := this.QueryInterface(ILearningModelSessionOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSessionOptions2 := ILearningModelSessionOptions2(outPtr)
        }

        return this.__ILearningModelSessionOptions2.put_CloseModelOnSessionCreation(value)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Provides the ability to override named input dimensions of a Learning Model to concrete values.
     * @remarks
     * Using this API can yield performance improvements, as it allows for preallocation of tensors during session creation that would otherwise be allocated during model evaluation.
     * @param {HSTRING} name The name of the input dimension to set.
     * @param {Integer} dimension The concrete value to assign to the specified dimension.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsessionoptions.overridenameddimension
     */
    OverrideNamedDimension(name, dimension) {
        if (!this.HasProp("__ILearningModelSessionOptions3")) {
            if ((queryResult := this.QueryInterface(ILearningModelSessionOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSessionOptions3 := ILearningModelSessionOptions3(outPtr)
        }

        return this.__ILearningModelSessionOptions3.OverrideNamedDimension(name, dimension)
    }

;@endregion Instance Methods
}
