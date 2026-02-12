#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILearningModelPreview.ahk
#Include .\ILearningModelPreviewStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Represents a machine learning model.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class LearningModelPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelPreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * **Deprecated.** Asynchronously loads a model from file storage.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @param {IStorageFile} modelFile The location of the model file.
     * @returns {IAsyncOperation<LearningModelPreview>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelpreview.loadmodelfromstoragefileasync
     */
    static LoadModelFromStorageFileAsync(modelFile) {
        if (!LearningModelPreview.HasProp("__ILearningModelPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.Preview.LearningModelPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelPreviewStatics.IID)
            LearningModelPreview.__ILearningModelPreviewStatics := ILearningModelPreviewStatics(factoryPtr)
        }

        return LearningModelPreview.__ILearningModelPreviewStatics.LoadModelFromStorageFileAsync(modelFile)
    }

    /**
     * **Deprecated.** Asynchronously loads a model from a provided stream.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @param {IRandomAccessStreamReference} modelStream The file stream for the model.
     * @returns {IAsyncOperation<LearningModelPreview>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelpreview.loadmodelfromstreamasync
     */
    static LoadModelFromStreamAsync(modelStream) {
        if (!LearningModelPreview.HasProp("__ILearningModelPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.Preview.LearningModelPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelPreviewStatics.IID)
            LearningModelPreview.__ILearningModelPreviewStatics := ILearningModelPreviewStatics(factoryPtr)
        }

        return LearningModelPreview.__ILearningModelPreviewStatics.LoadModelFromStreamAsync(modelStream)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * **Deprecated.** Gets the descriptive metadata for the trained machine learning model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelpreview.description
     * @type {LearningModelDescriptionPreview} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * **Deprecated.** Gets or sets the inferencing options for the evaluation of a model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelpreview.inferencingoptions
     * @type {InferencingOptionsPreview} 
     */
    InferencingOptions {
        get => this.get_InferencingOptions()
        set => this.put_InferencingOptions(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * **Deprecated.** Asynchronously evaluate the machine learning model using the feature value already bound in *binding*.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @param {LearningModelBindingPreview} binding_ The value bound to the named input and output features.
     * @param {HSTRING} correlationId_ Optional user-supplied string to connect the output results.
     * @returns {IAsyncOperation<LearningModelEvaluationResultPreview>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelpreview.evaluateasync
     */
    EvaluateAsync(binding_, correlationId_) {
        if (!this.HasProp("__ILearningModelPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelPreview := ILearningModelPreview(outPtr)
        }

        return this.__ILearningModelPreview.EvaluateAsync(binding_, correlationId_)
    }

    /**
     * **Deprecated.** Asynchronously evaluates names variable instances as the inputs and outputs for the model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * 
     * Prior to evaluation, this method performs and internal check onn feature constraints and binds the features as inputs. This is an alternative separately binding then evaluating the model, streamlining the validation and creation of workspace resources.
     * @param {IMap<HSTRING, IInspectable>} features The features to bind as inputs.
     * @param {HSTRING} correlationId_ The value to correlate the evaluation with the output results.
     * @returns {IAsyncOperation<LearningModelEvaluationResultPreview>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelpreview.evaluatefeaturesasync
     */
    EvaluateFeaturesAsync(features, correlationId_) {
        if (!this.HasProp("__ILearningModelPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelPreview := ILearningModelPreview(outPtr)
        }

        return this.__ILearningModelPreview.EvaluateFeaturesAsync(features, correlationId_)
    }

    /**
     * 
     * @returns {LearningModelDescriptionPreview} 
     */
    get_Description() {
        if (!this.HasProp("__ILearningModelPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelPreview := ILearningModelPreview(outPtr)
        }

        return this.__ILearningModelPreview.get_Description()
    }

    /**
     * 
     * @returns {InferencingOptionsPreview} 
     */
    get_InferencingOptions() {
        if (!this.HasProp("__ILearningModelPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelPreview := ILearningModelPreview(outPtr)
        }

        return this.__ILearningModelPreview.get_InferencingOptions()
    }

    /**
     * 
     * @param {InferencingOptionsPreview} value 
     * @returns {HRESULT} 
     */
    put_InferencingOptions(value) {
        if (!this.HasProp("__ILearningModelPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelPreview := ILearningModelPreview(outPtr)
        }

        return this.__ILearningModelPreview.put_InferencingOptions(value)
    }

;@endregion Instance Methods
}
