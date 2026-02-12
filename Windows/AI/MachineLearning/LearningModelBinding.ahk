#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\ILearningModelBinding.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\ILearningModelBindingFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Used to bind values to named input and output features.
 * @remarks
 * Models specify their input and output features using unique string names.   Before evaluating the model you can bind your inputs and outputs to the session using those names. To do this you use the **LearningModelBinding** object which you can create based on a session.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class LearningModelBinding extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelBinding

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelBinding.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a [LearningModelBinding](learningmodelbinding.md) from the specified [LearningModelSession](learningmodelsession.md).
     * @param {LearningModelSession} session The **LearningModelSession** from which to create the **LearningModelBinding**.
     * @returns {LearningModelBinding} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding.#ctor
     */
    static CreateFromSession(session) {
        if (!LearningModelBinding.HasProp("__ILearningModelBindingFactory")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModelBinding")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelBindingFactory.IID)
            LearningModelBinding.__ILearningModelBindingFactory := ILearningModelBindingFactory(factoryPtr)
        }

        return LearningModelBinding.__ILearningModelBindingFactory.CreateFromSession(session)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Gets the number of elements in the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding.size
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
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Bind a value to the named feature.
     * @param {HSTRING} name The name of the feature.
     * @param {IInspectable} value The value to bind.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding.bind
     */
    Bind(name, value) {
        if (!this.HasProp("__ILearningModelBinding")) {
            if ((queryResult := this.QueryInterface(ILearningModelBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelBinding := ILearningModelBinding(outPtr)
        }

        return this.__ILearningModelBinding.Bind(name, value)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Bind a value to the named feature using properties to control the binding.
     * @remarks
     * These are the valid key-value pairs for the *props* parameter:
     * 
     * Name                  | Value | Description
     * ----------------------|-------|------------------
     * BitmapBounds          | [PropertyType.UInt32Array](/uwp/api/windows.foundation.propertyvalue.createuint32array) | When binding an input, the BitmapBounds property specifies cropping boundaries. The cropped image will be extracted and used as the input for performing inference.<br><br>When binding an output, the BitmapBounds property specifies boundaries for a target output region. The result of inference will be written to the target output region within the bound image.<br><br>The BitmapBounds property is specified as a UInt32 array with the values `[left, top, width, height]`. <br><br>This property takes effect only when binding an [ImageFeatureValue](/uwp/api/windows.ai.machinelearning.imagefeaturevalue).|
     * BitmapPixelFormat     | [PropertyType.Int32](/uwp/api/windows.foundation.propertyvalue.createint32) | When binding an input or output, the BitmapPixelFormat property specifies the pixel format intended by the model author for a particular feature value. When the **Image.BitmapPixelFormat** metadata is missing from the ONNX model's [Image metadata](https://github.com/onnx/onnx/blob/main/docs/MetadataProps.md), it can be specified at runtime by using this property. Bound images will be automatically converted to the specified pixel format for consumption by the model. <br><br>The BitmapPixelFormat must be specified as an Int32 value corresponding to values in the [Windows.Graphics.Imaging.BitmapPixelFormat](/uwp/api/windows.graphics.imaging.bitmappixelformat) enumeration. Currently the following values are supported:<ul><li>BitmapPixelFormat.Rgba8</li><li>BitmapPixelFormat.Bgra8</li><li>BitmapPixelFormat.Gray8</li></ul>This property takes effect only when binding an [ImageFeatureValue](/uwp/api/windows.ai.machinelearning.imagefeaturevalue).|
     * DisableTensorCpuSync  | [PropertyType.Boolean](/uwp/api/windows.foundation.propertyvalue.createboolean) | When binding an output tensor backed by an ID3D12Resource, the DisableTensorCpuSync property can be used to prevent copying the GPU/NPU output back to a CPU tensor. By default, the [LearningModelSession.Evaluate](/uwp/api/windows.ai.machinelearning.learningmodelsession_evaluate) API call is a blocking call, and will ensure that inference results are available on the CPU post-completion. <br><br> In certain GPU/NPU evaluation scenarios, it's desirable to keep inference results on the GPU/NPU; and copying the results back to the CPU is unnecessary and slower. To avoid that copy, enable the DisableTensorCpuSync property during binding.<br><br>This property takes effect only when binding an [ITensor](/uwp/api/windows.ai.machinelearning.itensor) or its concrete types (that is, [TensorFloat](/uwp/api/windows.ai.machinelearning.tensorfloat)).<br><br>This property was introduced in Windows 11, version 21H2 (10.0; Build 22000).|
     * PixelRange            | [PropertyType.Int32](/uwp/api/windows.foundation.propertyvalue.createint32) | When binding an input or output, the PixelRange property specifies the normalization range intended by the model author for a particular feature value. When the **Image.NominalPixelRange** metadata is missing from the ONNX model's [Image metadata](https://github.com/onnx/onnx/blob/main/docs/MetadataProps.md), it can be specified at runtime by using this property. Bound images will be automatically converted to the specified normalized range for consumption by the model. <br><br>The PixelRange must be specified as an Int32 value corresponding to values in the [Windows.AI.MachineLearning.LearningModelPixelRange](/uwp/api/windows.ai.machinelearning.learningmodelpixelrange) enumeration.<br><br>This property takes effect only when binding an [ImageFeatureValue](/uwp/api/windows.ai.machinelearning.imagefeaturevalue).
     * @param {HSTRING} name The name of the feature to which to bind.
     * @param {IInspectable} value The value to bind to the feature.
     * @param {IPropertySet} props A property map with key-value pairs describing the binding's tensorization and detensorization behavior. For more details, see the **Remarks** section.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding.bind
     */
    BindWithProperties(name, value, props) {
        if (!this.HasProp("__ILearningModelBinding")) {
            if ((queryResult := this.QueryInterface(ILearningModelBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelBinding := ILearningModelBinding(outPtr)
        }

        return this.__ILearningModelBinding.BindWithProperties(name, value, props)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Remove all bindings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding.clear
     */
    Clear() {
        if (!this.HasProp("__ILearningModelBinding")) {
            if ((queryResult := this.QueryInterface(ILearningModelBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelBinding := ILearningModelBinding(outPtr)
        }

        return this.__ILearningModelBinding.Clear()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the item at the specified key in the map view.
     * @param {Generic} key The key in the map view to look up.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding.lookup
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
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Determines whether the map view contains the specified key.
     * @param {Generic} key The key to check if it is contained in the map view.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding.haskey
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
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Splits the map view into two views.
     * @remarks
     * The two views that result from the split operation may not contain the same number of items. The two views do not overlap.
     * 
     * If the map view cannot be split, then both the first and second parameters are **null** when the method returns.
     * @param {Pointer<IMapView>} first One half of the original map.
     * @param {Pointer<IMapView>} second The second half of the original map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding.split
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
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns an iterator that is initialized to the first element in the map view.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelbinding.first
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
