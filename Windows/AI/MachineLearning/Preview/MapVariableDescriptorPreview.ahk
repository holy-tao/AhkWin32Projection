#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapVariableDescriptorPreview.ahk
#Include .\ILearningModelVariableDescriptorPreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Represents the map variable descriptor information.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.mapvariabledescriptorpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class MapVariableDescriptorPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapVariableDescriptorPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapVariableDescriptorPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets the data type of the key for the map variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.mapvariabledescriptorpreview.keykind
     * @type {Integer} 
     */
    KeyKind {
        get => this.get_KeyKind()
    }

    /**
     * **Deprecated.** Gets the valid string keys of the map variable descriptor.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.mapvariabledescriptorpreview.validstringkeys
     * @type {IIterable<HSTRING>} 
     */
    ValidStringKeys {
        get => this.get_ValidStringKeys()
    }

    /**
     * **Deprecated.** Gets the valid integer keys for the map variable descriptor.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.mapvariabledescriptorpreview.validintegerkeys
     * @type {IIterable<Integer>} 
     */
    ValidIntegerKeys {
        get => this.get_ValidIntegerKeys()
    }

    /**
     * **Deprecated.** Gets the data type of the field of the map variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.mapvariabledescriptorpreview.fields
     * @type {ILearningModelVariableDescriptorPreview} 
     */
    Fields {
        get => this.get_Fields()
    }

    /**
     * **Deprecated.** Gets the name of the map variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.mapvariabledescriptorpreview.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * **Deprecated.** Gets the description map variable.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.mapvariabledescriptorpreview.description
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.mapvariabledescriptorpreview.modelfeaturekind
     * @type {Integer} 
     */
    ModelFeatureKind {
        get => this.get_ModelFeatureKind()
    }

    /**
     * **Deprecated.** If true, you must bind a value to this feature before evaluating the **LearningModelSession**.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.mapvariabledescriptorpreview.isrequired
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
    get_KeyKind() {
        if (!this.HasProp("__IMapVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(IMapVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapVariableDescriptorPreview := IMapVariableDescriptorPreview(outPtr)
        }

        return this.__IMapVariableDescriptorPreview.get_KeyKind()
    }

    /**
     * 
     * @returns {IIterable<HSTRING>} 
     */
    get_ValidStringKeys() {
        if (!this.HasProp("__IMapVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(IMapVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapVariableDescriptorPreview := IMapVariableDescriptorPreview(outPtr)
        }

        return this.__IMapVariableDescriptorPreview.get_ValidStringKeys()
    }

    /**
     * 
     * @returns {IIterable<Integer>} 
     */
    get_ValidIntegerKeys() {
        if (!this.HasProp("__IMapVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(IMapVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapVariableDescriptorPreview := IMapVariableDescriptorPreview(outPtr)
        }

        return this.__IMapVariableDescriptorPreview.get_ValidIntegerKeys()
    }

    /**
     * 
     * @returns {ILearningModelVariableDescriptorPreview} 
     */
    get_Fields() {
        if (!this.HasProp("__IMapVariableDescriptorPreview")) {
            if ((queryResult := this.QueryInterface(IMapVariableDescriptorPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapVariableDescriptorPreview := IMapVariableDescriptorPreview(outPtr)
        }

        return this.__IMapVariableDescriptorPreview.get_Fields()
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
