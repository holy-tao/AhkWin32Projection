#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITensorDouble.ahk
#Include .\ITensor.ahk
#Include .\ILearningModelFeatureValue.ahk
#Include ..\..\Foundation\IMemoryBuffer.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ITensorDoubleStatics2.ahk
#Include .\ITensorDoubleStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * A 64-bit float tensor object.
 * @remarks
 * A tensor is a multi-dimensional array of values. A double tensor is a tensor of 64-bit floating point values.
 * 
 * The layout of tensors is row-major, with tightly packed contiguous data representing each dimension. The total size of a tensor is the product of the size of each dimension.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class TensorDouble extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITensorDouble

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITensorDouble.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 64-bit float tensor object, allocates a buffer of size *shape*, and copies all of *data* into it.
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape The size of the buffer.
     * @param {Integer} data_length 
     * @param {Pointer<Float>} data The data to copy into the buffer.
     * @returns {TensorDouble} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.createfromshapearrayanddataarray
     */
    static CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data) {
        if (!TensorDouble.HasProp("__ITensorDoubleStatics2")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorDouble")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorDoubleStatics2.IID)
            TensorDouble.__ITensorDoubleStatics2 := ITensorDoubleStatics2(factoryPtr)
        }

        return TensorDouble.__ITensorDoubleStatics2.CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a double tensor object with the given *shape* and uses the underlying buffer in *data* for subsequent evaluation.
     * @remarks
     * No copies are performed during the creation of this object and the underlying buffer in *data* is used directly by the engine.
     * 
     * Copies to video memory are made when running on non-CPU devices.
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape The size of the buffer.
     * @param {IBuffer} buffer_ The buffer to use during evaluation.
     * @returns {TensorDouble} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.createfrombuffer
     */
    static CreateFromBuffer(shape_length, shape, buffer_) {
        if (!TensorDouble.HasProp("__ITensorDoubleStatics2")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorDouble")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorDoubleStatics2.IID)
            TensorDouble.__ITensorDoubleStatics2 := ITensorDoubleStatics2(factoryPtr)
        }

        return TensorDouble.__ITensorDoubleStatics2.CreateFromBuffer(shape_length, shape, buffer_)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 64-bit float tensor object and allocates a buffer of size *shape*.
     * @returns {TensorDouble} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.create
     */
    static Create() {
        if (!TensorDouble.HasProp("__ITensorDoubleStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorDouble")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorDoubleStatics.IID)
            TensorDouble.__ITensorDoubleStatics := ITensorDoubleStatics(factoryPtr)
        }

        return TensorDouble.__ITensorDoubleStatics.Create()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 64-bit float tensor object without allocating a buffer.
     * @param {IIterable<Integer>} shape_ 
     * @returns {TensorDouble} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.create
     */
    static Create2(shape_) {
        if (!TensorDouble.HasProp("__ITensorDoubleStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorDouble")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorDoubleStatics.IID)
            TensorDouble.__ITensorDoubleStatics := ITensorDoubleStatics(factoryPtr)
        }

        return TensorDouble.__ITensorDoubleStatics.Create2(shape_)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 64-bit float tensor object, allocates a buffer of size *shape*, and copies all of *data* into it.
     * @param {IIterable<Integer>} shape_ The size of the buffer.
     * @param {Integer} data_length 
     * @param {Pointer<Float>} data The data to copy into the buffer.
     * @returns {TensorDouble} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.createfromarray
     */
    static CreateFromArray(shape_, data_length, data) {
        if (!TensorDouble.HasProp("__ITensorDoubleStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorDouble")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorDoubleStatics.IID)
            TensorDouble.__ITensorDoubleStatics := ITensorDoubleStatics(factoryPtr)
        }

        return TensorDouble.__ITensorDoubleStatics.CreateFromArray(shape_, data_length, data)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 64-bit float tensor object, allocates a buffer of size *shape*, and copies all of *data* into it.
     * @param {IIterable<Integer>} shape_ The size of the buffer.
     * @param {IIterable<Float>} data The data to copy into the buffer.
     * @returns {TensorDouble} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.createfromiterable
     */
    static CreateFromIterable(shape_, data) {
        if (!TensorDouble.HasProp("__ITensorDoubleStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorDouble")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorDoubleStatics.IID)
            TensorDouble.__ITensorDoubleStatics := ITensorDoubleStatics(factoryPtr)
        }

        return TensorDouble.__ITensorDoubleStatics.CreateFromIterable(shape_, data)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the data type of the tensor.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.tensorkind
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.shape
     * @type {IVectorView<Integer>} 
     */
    Shape {
        get => this.get_Shape()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The kind of the feature.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.kind
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
     * @returns {IVectorView<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.getasvectorview
     */
    GetAsVectorView() {
        if (!this.HasProp("__ITensorDouble")) {
            if ((queryResult := this.QueryInterface(ITensorDouble.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITensorDouble := ITensorDouble(outPtr)
        }

        return this.__ITensorDouble.GetAsVectorView()
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
     * Returns an [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) representation of the buffer backing the double tensor object.
     * @remarks
     * All [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) objects produced by this method must be closed prior to the double tensor object's evaluation.
     * 
     * Outstanding [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) objects are an indication to the engine that the underlying buffer is currently being modified via the **IMemoryBufferByteAccess** native interop interface, and is not ready for evaluation.
     * @returns {IMemoryBufferReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.createreference
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensordouble.close
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
