#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITensorVariableDescriptorPreview.ahk
#Include .\ILearningModelVariableDescriptorPreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Represents a Tensor variable's descriptor information.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * 
 * This type maps to a multi-dimensional array or the .NET Tensor
 * 
 * A tensor type, regardless of its dimension, is mapped to IList.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.tensorvariabledescriptorpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class TensorVariableDescriptorPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITensorVariableDescriptorPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITensorVariableDescriptorPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets the type of the tensor data.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.tensorvariabledescriptorpreview.datatype
     * @type {Integer} 
     */
    DataType {
        get => this.get_DataType()
    }

    /**
     * **Deprecated.** Gets the n-dimensional shape of the tensor.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.tensorvariabledescriptorpreview.shape
     * @type {IIterable<Integer>} 
     */
    Shape {
        get => this.get_Shape()
    }

    /**
     * **Deprecated.** Gets the name of the tensor.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.tensorvariabledescriptorpreview.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * **Deprecated.** Gets the description of the tensor.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.tensorvariabledescriptorpreview.description
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.tensorvariabledescriptorpreview.modelfeaturekind
     * @type {Integer} 
     */
    ModelFeatureKind {
        get => this.get_ModelFeatureKind()
    }

    /**
     * **Deprecated.** Gets whether the tensor is required.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.tensorvariabledescriptorpreview.isrequired
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
     * @returns {Integer} 
     */
    get_DataType() {
        if (!this.HasProp("__ITensorVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(ITensorVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITensorVariableDescriptorPreview := ITensorVariableDescriptorPreview(outPtr)
        }

        return this.__ITensorVariableDescriptorPreview.get_DataType()
    }

    /**
     * 
     * @returns {IIterable<Integer>} 
     */
    get_Shape() {
        if (!this.HasProp("__ITensorVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(ITensorVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITensorVariableDescriptorPreview := ITensorVariableDescriptorPreview(outPtr)
        }

        return this.__ITensorVariableDescriptorPreview.get_Shape()
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
