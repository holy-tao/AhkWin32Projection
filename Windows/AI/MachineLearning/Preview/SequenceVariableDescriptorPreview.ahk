#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISequenceVariableDescriptorPreview.ahk
#Include .\ILearningModelVariableDescriptorPreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Represents a sequence variable's descriptor information.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.sequencevariabledescriptorpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class SequenceVariableDescriptorPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISequenceVariableDescriptorPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISequenceVariableDescriptorPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets the type of the sequence variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.sequencevariabledescriptorpreview.elementtype
     * @type {ILearningModelVariableDescriptorPreview} 
     */
    ElementType {
        get => this.get_ElementType()
    }

    /**
     * **Deprecated.** Gets the name of the sequence variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.sequencevariabledescriptorpreview.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * **Deprecated.** Gets the description of the sequence variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.sequencevariabledescriptorpreview.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * **Deprecated.** Gets the data type of the variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.sequencevariabledescriptorpreview.modelfeaturekind
     * @type {Integer} 
     */
    ModelFeatureKind {
        get => this.get_ModelFeatureKind()
    }

    /**
     * **Deprecated.** Gets whether the sequence variable is required.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.sequencevariabledescriptorpreview.isrequired
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
     * @returns {ILearningModelVariableDescriptorPreview} 
     */
    get_ElementType() {
        if (!this.HasProp("__ISequenceVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(ISequenceVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISequenceVariableDescriptorPreview := ISequenceVariableDescriptorPreview(outPtr)
        }

        return this.__ISequenceVariableDescriptorPreview.get_ElementType()
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
