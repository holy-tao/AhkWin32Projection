#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageVariableDescriptorPreview.ahk
#Include .\ILearningModelVariableDescriptorPreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Represents the image descriptor information.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.imagevariabledescriptorpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class ImageVariableDescriptorPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageVariableDescriptorPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageVariableDescriptorPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets the pixel format of the image.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.imagevariabledescriptorpreview.bitmappixelformat
     * @type {Integer} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * **Deprecated.** Gets the width of the image variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.imagevariabledescriptorpreview.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * **Deprecated.** Gets the height of the image variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.imagevariabledescriptorpreview.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * **Deprecated.** Gets the name of the image variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * 
     * This must be unique across all variables in the model.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.imagevariabledescriptorpreview.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * **Deprecated.** Gets the description of the image variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.imagevariabledescriptorpreview.description
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.imagevariabledescriptorpreview.modelfeaturekind
     * @type {Integer} 
     */
    ModelFeatureKind {
        get => this.get_ModelFeatureKind()
    }

    /**
     * **Deprecated.** Gets whether the image variable is required.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.imagevariabledescriptorpreview.isrequired
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
    get_BitmapPixelFormat() {
        if (!this.HasProp("__IImageVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(IImageVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageVariableDescriptorPreview := IImageVariableDescriptorPreview(outPtr)
        }

        return this.__IImageVariableDescriptorPreview.get_BitmapPixelFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IImageVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(IImageVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageVariableDescriptorPreview := IImageVariableDescriptorPreview(outPtr)
        }

        return this.__IImageVariableDescriptorPreview.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IImageVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(IImageVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageVariableDescriptorPreview := IImageVariableDescriptorPreview(outPtr)
        }

        return this.__IImageVariableDescriptorPreview.get_Height()
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
