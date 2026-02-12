#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\ILearningModelBindingPreview.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include .\ILearningModelBindingPreviewFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Represents the associations between model inputs and variable instances.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class LearningModelBindingPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelBindingPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelBindingPreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * **Deprecated.** Creates a **LearningModelBinding** from the specified **LearningModelSession**.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @param {LearningModelPreview} model The **LearningModelSession** from which to create the **LearningModelBinding**.
     * @returns {LearningModelBindingPreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview.#ctor
     */
    static CreateFromModel(model) {
        if (!LearningModelBindingPreview.HasProp("__ILearningModelBindingPreviewFactory")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.Preview.LearningModelBindingPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelBindingPreviewFactory.IID)
            LearningModelBindingPreview.__ILearningModelBindingPreviewFactory := ILearningModelBindingPreviewFactory(factoryPtr)
        }

        return LearningModelBindingPreview.__ILearningModelBindingPreviewFactory.CreateFromModel(model)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * **Deprecated.** Gets the number of elements in the map.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * **Deprecated.** Binds a single input or output feature to a defined variable.
     * @remarks
     * **Note**: Currently, outputs of type `double` are not supported. If possible, consider using type `float` instead.
     * 
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @param {HSTRING} name The name of the input/output feature.
     * @param {IInspectable} value The value of the input/output feature.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview.bind
     */
    Bind(name, value) {
        if (!this.HasProp("__ILearningModelBindingPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelBindingPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelBindingPreview := ILearningModelBindingPreview(outPtr)
        }

        return this.__ILearningModelBindingPreview.Bind(name, value)
    }

    /**
     * **Deprecated.** Binds a single input or output feature to a defined variable, with specified metadata.
     * @remarks
     * **Note**: Currently, outputs of type `double` are not supported. If possible, consider using type `float` instead.
     * 
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @param {HSTRING} name The name of the input/output feature.
     * @param {IInspectable} value The value of the input/output feature.
     * @param {IPropertySet} metadata The specified metadata for the input/output feature.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview.bind
     */
    BindWithProperties(name, value, metadata) {
        if (!this.HasProp("__ILearningModelBindingPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelBindingPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelBindingPreview := ILearningModelBindingPreview(outPtr)
        }

        return this.__ILearningModelBindingPreview.BindWithProperties(name, value, metadata)
    }

    /**
     * **Deprecated.** Clears all bound variables.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview.clear
     */
    Clear() {
        if (!this.HasProp("__ILearningModelBindingPreview")) {
            if ((queryResult := this.QueryInterface(ILearningModelBindingPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelBindingPreview := ILearningModelBindingPreview(outPtr)
        }

        return this.__ILearningModelBindingPreview.Clear()
    }

    /**
     * **Deprecated.** Returns the item at the specified key in the map view.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @param {Generic} key The key in the map view to look up.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.get_Size()
    }

    /**
     * **Deprecated.** Determines whether the map view contains the specified key.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @param {Generic} key The key to check if it is contained in the map view.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.HasKey(key)
    }

    /**
     * **Deprecated.** Splits the map view into two views.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @param {Pointer<IMapView>} first One half of the original map.
     * @param {Pointer<IMapView>} second The second half of the original map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview.split
     */
    Split(first, second) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.Split(first, second)
    }

    /**
     * **Deprecated.** Returns an iterator that is initialized to the first element in the map view.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelbindingpreview.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{fe2f3d47-5d47-5499-8374-430c7cda0204}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), IInspectable), outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
