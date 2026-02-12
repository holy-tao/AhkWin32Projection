#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILearningModelVariableDescriptorPreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Represents the learning model variable descriptor information.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelvariabledescriptorpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class LearningModelVariableDescriptorPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelVariableDescriptorPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelVariableDescriptorPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets the name of the learning model variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelvariabledescriptorpreview.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * **Deprecated.** Gets the description of the learning model variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelvariabledescriptorpreview.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * **Deprecated.** Gets the feature kind of the learning model variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelvariabledescriptorpreview.modelfeaturekind
     * @type {Integer} 
     */
    ModelFeatureKind {
        get => this.get_ModelFeatureKind()
    }

    /**
     * **Deprecated.** Gets whether the learning model variable is required
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelvariabledescriptorpreview.isrequired
     * @type {Boolean} 
     */
    IsRequired {
        get => this.get_IsRequired()
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
    get_Name() {
        if (!this.HasProp("__ILearningModelVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelVariableDescriptorPreview := ILearningModelVariableDescriptorPreview(outPtr)
        }

        return this.__ILearningModelVariableDescriptorPreview.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__ILearningModelVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelVariableDescriptorPreview := ILearningModelVariableDescriptorPreview(outPtr)
        }

        return this.__ILearningModelVariableDescriptorPreview.get_Description()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ModelFeatureKind() {
        if (!this.HasProp("__ILearningModelVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelVariableDescriptorPreview := ILearningModelVariableDescriptorPreview(outPtr)
        }

        return this.__ILearningModelVariableDescriptorPreview.get_ModelFeatureKind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRequired() {
        if (!this.HasProp("__ILearningModelVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelVariableDescriptorPreview := ILearningModelVariableDescriptorPreview(outPtr)
        }

        return this.__ILearningModelVariableDescriptorPreview.get_IsRequired()
    }

;@endregion Instance Methods
}
