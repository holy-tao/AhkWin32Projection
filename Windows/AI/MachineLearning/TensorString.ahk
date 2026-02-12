#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITensorString.ahk
#Include .\ITensor.ahk
#Include .\ILearningModelFeatureValue.ahk
#Include ..\..\Foundation\IMemoryBuffer.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ITensorStringStatics2.ahk
#Include .\ITensorStringStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * A string tensor object.
 * @remarks
 * A tensor is a multi-dimensional array of values. A string tensor is a tensor of string values.
 * 
 * The layout of tensors is row-major, with tightly packed contiguous data representing each dimension. The total size of a tensor is the product of the size of each dimension.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class TensorString extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITensorString

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITensorString.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a string tensor object, allocates a buffer of size *shape*, and copies all of *data* into it.
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape The size of the buffer.
     * @param {Integer} data_length 
     * @param {Pointer<HSTRING>} data The data to copy into the buffer.
     * @returns {TensorString} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.createfromshapearrayanddataarray
     */
    static CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data) {
        if (!TensorString.HasProp("__ITensorStringStatics2")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorString")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorStringStatics2.IID)
            TensorString.__ITensorStringStatics2 := ITensorStringStatics2(factoryPtr)
        }

        return TensorString.__ITensorStringStatics2.CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a string tensor object and allocates a buffer of size *shape*.
     * @returns {TensorString} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.create
     */
    static Create() {
        if (!TensorString.HasProp("__ITensorStringStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorString")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorStringStatics.IID)
            TensorString.__ITensorStringStatics := ITensorStringStatics(factoryPtr)
        }

        return TensorString.__ITensorStringStatics.Create()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a string tensor object without allocating a buffer.
     * @param {IIterable<Integer>} shape_ 
     * @returns {TensorString} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.create
     */
    static Create2(shape_) {
        if (!TensorString.HasProp("__ITensorStringStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorString")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorStringStatics.IID)
            TensorString.__ITensorStringStatics := ITensorStringStatics(factoryPtr)
        }

        return TensorString.__ITensorStringStatics.Create2(shape_)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a string tensor object, allocates a buffer of size *shape*, and copies all of *data* into it.
     * @param {IIterable<Integer>} shape_ The size of the buffer.
     * @param {Integer} data_length 
     * @param {Pointer<HSTRING>} data The data to copy into the buffer.
     * @returns {TensorString} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.createfromarray
     */
    static CreateFromArray(shape_, data_length, data) {
        if (!TensorString.HasProp("__ITensorStringStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorString")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorStringStatics.IID)
            TensorString.__ITensorStringStatics := ITensorStringStatics(factoryPtr)
        }

        return TensorString.__ITensorStringStatics.CreateFromArray(shape_, data_length, data)
    }

    /**
     * Creates a string tensor object, allocates a buffer of size *shape*, and copies all of *data* into it.
     * @param {IIterable<Integer>} shape_ The size of the buffer.
     * @param {IIterable<HSTRING>} data The data to copy into the buffer.
     * @returns {TensorString} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.createfromiterable
     */
    static CreateFromIterable(shape_, data) {
        if (!TensorString.HasProp("__ITensorStringStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorString")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorStringStatics.IID)
            TensorString.__ITensorStringStatics := ITensorStringStatics(factoryPtr)
        }

        return TensorString.__ITensorStringStatics.CreateFromIterable(shape_, data)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the data type of the tensor.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.tensorkind
     * @type {Integer} 
     */
    TensorKind {
        get => this.get_TensorKind()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the count and size of each dimension.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.shape
     * @type {IVectorView<Integer>} 
     */
    Shape {
        get => this.get_Shape()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the kind of the feature.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns a read-only view of the data.
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.getasvectorview
     */
    GetAsVectorView() {
        if (!this.HasProp("__ITensorString")) {
            if ((queryResult := this.QueryInterface(ITensorString.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITensorString := ITensorString(outPtr)
        }

        return this.__ITensorString.GetAsVectorView()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TensorKind() {
        if (!this.HasProp("__ITensor")) {
            if ((queryResult := this.QueryInterface(ITensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITensor := ITensor(outPtr)
        }

        return this.__ITensor.get_TensorKind()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_Shape() {
        if (!this.HasProp("__ITensor")) {
            if ((queryResult := this.QueryInterface(ITensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITensor := ITensor(outPtr)
        }

        return this.__ITensor.get_Shape()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__ILearningModelFeatureValue")) {
            if ((queryResult := this.QueryInterface(ILearningModelFeatureValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelFeatureValue := ILearningModelFeatureValue(outPtr)
        }

        return this.__ILearningModelFeatureValue.get_Kind()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * This method is disallowed on [TensorString](tensorstring.md) objects and should not be used.
     * @remarks
     * **TensorString** objects do not provide native access to their underlying buffer resources via the [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) and **IMemoryBufferByteAccess** access pattern.
     * @returns {IMemoryBufferReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.createreference
     */
    CreateReference() {
        if (!this.HasProp("__IMemoryBuffer")) {
            if ((queryResult := this.QueryInterface(IMemoryBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMemoryBuffer := IMemoryBuffer(outPtr)
        }

        return this.__IMemoryBuffer.CreateReference()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * If there are no outstanding [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) objects created from this object, **Close** will dispose of the object and destroy its associated resources. Otherwise, **Close** will detach itself from its associated resources and they will be destroyed when the last [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) is closed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorstring.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
