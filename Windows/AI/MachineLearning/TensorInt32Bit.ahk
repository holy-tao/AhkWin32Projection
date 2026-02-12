#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITensorInt32Bit.ahk
#Include .\ITensor.ahk
#Include .\ILearningModelFeatureValue.ahk
#Include ..\..\Foundation\IMemoryBuffer.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ITensorInt32BitStatics.ahk
#Include .\ITensorInt32BitStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * A 32-bit signed integer tensor object.
 * @remarks
 * A tensor is a multi-dimensional array of values. A 32-bit signed integer tensor is a tensor of 32-bit signed integer values.
 * 
 * The layout of tensors is row-major, with tightly packed contiguous data representing each dimension. The total size of a tensor is the product of the size of each dimension.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class TensorInt32Bit extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITensorInt32Bit

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITensorInt32Bit.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 32-bit signed integer tensor object and allocates a buffer of size *shape*.
     * @returns {TensorInt32Bit} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.create
     */
    static Create() {
        if (!TensorInt32Bit.HasProp("__ITensorInt32BitStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorInt32Bit")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorInt32BitStatics.IID)
            TensorInt32Bit.__ITensorInt32BitStatics := ITensorInt32BitStatics(factoryPtr)
        }

        return TensorInt32Bit.__ITensorInt32BitStatics.Create()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 32-bit signed integer tensor object without allocating a buffer.
     * @param {IIterable<Integer>} shape_ 
     * @returns {TensorInt32Bit} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.create
     */
    static Create2(shape_) {
        if (!TensorInt32Bit.HasProp("__ITensorInt32BitStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorInt32Bit")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorInt32BitStatics.IID)
            TensorInt32Bit.__ITensorInt32BitStatics := ITensorInt32BitStatics(factoryPtr)
        }

        return TensorInt32Bit.__ITensorInt32BitStatics.Create2(shape_)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 32-bit signed integer tensor object, allocates a buffer of size *shape*, and copies all of *data* into it.
     * @param {IIterable<Integer>} shape_ The size of the buffer.
     * @param {Integer} data_length 
     * @param {Pointer<Integer>} data The data to copy into the buffer.
     * @returns {TensorInt32Bit} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.createfromarray
     */
    static CreateFromArray(shape_, data_length, data) {
        if (!TensorInt32Bit.HasProp("__ITensorInt32BitStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorInt32Bit")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorInt32BitStatics.IID)
            TensorInt32Bit.__ITensorInt32BitStatics := ITensorInt32BitStatics(factoryPtr)
        }

        return TensorInt32Bit.__ITensorInt32BitStatics.CreateFromArray(shape_, data_length, data)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 32-bit signed integer tensor object, allocates a buffer of size *shape*, and copies all of *data* into it.
     * @param {IIterable<Integer>} shape_ The size of the buffer.
     * @param {IIterable<Integer>} data The data to copy into the buffer.
     * @returns {TensorInt32Bit} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.createfromiterable
     */
    static CreateFromIterable(shape_, data) {
        if (!TensorInt32Bit.HasProp("__ITensorInt32BitStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorInt32Bit")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorInt32BitStatics.IID)
            TensorInt32Bit.__ITensorInt32BitStatics := ITensorInt32BitStatics(factoryPtr)
        }

        return TensorInt32Bit.__ITensorInt32BitStatics.CreateFromIterable(shape_, data)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 32-bit signed integer tensor object, allocates a buffer of size *shape*, and copies all of *data* into it.
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape The size of the buffer.
     * @param {Integer} data_length 
     * @param {Pointer<Integer>} data The data to copy into the buffer.
     * @returns {TensorInt32Bit} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.createfromshapearrayanddataarray
     */
    static CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data) {
        if (!TensorInt32Bit.HasProp("__ITensorInt32BitStatics2")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorInt32Bit")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorInt32BitStatics2.IID)
            TensorInt32Bit.__ITensorInt32BitStatics2 := ITensorInt32BitStatics2(factoryPtr)
        }

        return TensorInt32Bit.__ITensorInt32BitStatics2.CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a 32-bit signed integer tensor object with the given *shape* and uses the underlying buffer in *buffer* for subsequent evaluation.
     * @remarks
     * No copies are performed during the creation of this object and the underlying buffer in *buffer* is used directly by the engine.
     * 
     * Copies to video memory are made when running on non-CPU devices.
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape The size of the buffer.
     * @param {IBuffer} buffer_ The buffer to use during evaluation.
     * @returns {TensorInt32Bit} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.createfrombuffer
     */
    static CreateFromBuffer(shape_length, shape, buffer_) {
        if (!TensorInt32Bit.HasProp("__ITensorInt32BitStatics2")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.TensorInt32Bit")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITensorInt32BitStatics2.IID)
            TensorInt32Bit.__ITensorInt32BitStatics2 := ITensorInt32BitStatics2(factoryPtr)
        }

        return TensorInt32Bit.__ITensorInt32BitStatics2.CreateFromBuffer(shape_length, shape, buffer_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the data type of the tensor.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.tensorkind
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.shape
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.kind
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
     * @returns {IVectorView<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.getasvectorview
     */
    GetAsVectorView() {
        if (!this.HasProp("__ITensorInt32Bit")) {
            if ((queryResult := this.QueryInterface(ITensorInt32Bit.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITensorInt32Bit := ITensorInt32Bit(outPtr)
        }

        return this.__ITensorInt32Bit.GetAsVectorView()
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
     * Returns an [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) representation of the buffer backing the 32-bit signed integer tensor object.
     * @remarks
     * All [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) objects produced by this method must be closed prior to the 32-bit signed integer tensor object's evaluation.
     * 
     * Outstanding [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) objects are an indication to the engine that the underlying buffer is currently being modified via the **IMemoryBufferByteAccess** native interop interface, and is not ready for evaluation.
     * @returns {IMemoryBufferReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.createreference
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorint32bit.close
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
