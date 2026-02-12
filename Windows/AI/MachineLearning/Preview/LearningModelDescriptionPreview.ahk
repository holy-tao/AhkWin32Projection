#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILearningModelDescriptionPreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Represents the metadata and property descriptions for the provided model.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldescriptionpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class LearningModelDescriptionPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelDescriptionPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelDescriptionPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets the author information from the model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldescriptionpreview.author
     * @type {HSTRING} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * **Deprecated.** Gets the name of the model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldescriptionpreview.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * **Deprecated.** Gets the domain information for the model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldescriptionpreview.domain
     * @type {HSTRING} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * **Deprecated.** Gets the custom description of the model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldescriptionpreview.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * **Deprecated.** Gets the version information of the model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldescriptionpreview.version
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * **Deprecated.** Gets the metadata from the model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldescriptionpreview.metadata
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Metadata {
        get => this.get_Metadata()
    }

    /**
     * **Deprecated.** Gets the input descriptions for the model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldescriptionpreview.inputfeatures
     * @type {IIterable<ILearningModelVariableDescriptorPreview>} 
     */
    InputFeatures {
        get => this.get_InputFeatures()
    }

    /**
     * **Deprecated.** Gets the output descriptions of the model.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldescriptionpreview.outputfeatures
     * @type {IIterable<ILearningModelVariableDescriptorPreview>} 
     */
    OutputFeatures {
        get => this.get_OutputFeatures()
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
    get_Author() {
        if (!this.HasProp("__ILearningModelDescriptionPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelDescriptionPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDescriptionPreview := ILearningModelDescriptionPreview(outPtr)
        }

        return this.__ILearningModelDescriptionPreview.get_Author()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ILearningModelDescriptionPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelDescriptionPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDescriptionPreview := ILearningModelDescriptionPreview(outPtr)
        }

        return this.__ILearningModelDescriptionPreview.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Domain() {
        if (!this.HasProp("__ILearningModelDescriptionPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelDescriptionPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDescriptionPreview := ILearningModelDescriptionPreview(outPtr)
        }

        return this.__ILearningModelDescriptionPreview.get_Domain()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__ILearningModelDescriptionPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelDescriptionPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDescriptionPreview := ILearningModelDescriptionPreview(outPtr)
        }

        return this.__ILearningModelDescriptionPreview.get_Description()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        if (!this.HasProp("__ILearningModelDescriptionPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelDescriptionPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDescriptionPreview := ILearningModelDescriptionPreview(outPtr)
        }

        return this.__ILearningModelDescriptionPreview.get_Version()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Metadata() {
        if (!this.HasProp("__ILearningModelDescriptionPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelDescriptionPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDescriptionPreview := ILearningModelDescriptionPreview(outPtr)
        }

        return this.__ILearningModelDescriptionPreview.get_Metadata()
    }

    /**
     * 
     * @returns {IIterable<ILearningModelVariableDescriptorPreview>} 
     */
    get_InputFeatures() {
        if (!this.HasProp("__ILearningModelDescriptionPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelDescriptionPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDescriptionPreview := ILearningModelDescriptionPreview(outPtr)
        }

        return this.__ILearningModelDescriptionPreview.get_InputFeatures()
    }

    /**
     * 
     * @returns {IIterable<ILearningModelVariableDescriptorPreview>} 
     */
    get_OutputFeatures() {
        if (!this.HasProp("__ILearningModelDescriptionPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelDescriptionPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDescriptionPreview := ILearningModelDescriptionPreview(outPtr)
        }

        return this.__ILearningModelDescriptionPreview.get_OutputFeatures()
    }

;@endregion Instance Methods
}
