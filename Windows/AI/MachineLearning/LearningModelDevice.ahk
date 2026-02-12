#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILearningModelDevice.ahk
#Include .\ILearningModelDeviceFactory.ahk
#Include .\ILearningModelDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * The device used to evaluate the machine learning model.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodeldevice
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class LearningModelDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Create a [LearningModelDevice](learningmodeldevice.md) from the specified [LearningModelDeviceKind](learningmodeldevicekind.md).
     * @param {Integer} deviceKind The specified **LearningModelDeviceKind** to evaluate the model on.
     * @returns {LearningModelDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodeldevice.#ctor
     */
    static Create(deviceKind) {
        if (!LearningModelDevice.HasProp("__ILearningModelDeviceFactory")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModelDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelDeviceFactory.IID)
            LearningModelDevice.__ILearningModelDeviceFactory := ILearningModelDeviceFactory(factoryPtr)
        }

        return LearningModelDevice.__ILearningModelDeviceFactory.Create(deviceKind)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Create a [LearningModelDevice](learningmodeldevice.md) from the specified [IDirect3DDevice](../windows.graphics.directx.direct3d11/idirect3ddevice.md).
     * @param {IDirect3DDevice} device The **IDirect3DDevice** from which to create a **LearningModelDevice**.
     * @returns {LearningModelDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodeldevice.createfromdirect3d11device
     */
    static CreateFromDirect3D11Device(device) {
        if (!LearningModelDevice.HasProp("__ILearningModelDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModelDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelDeviceStatics.IID)
            LearningModelDevice.__ILearningModelDeviceStatics := ILearningModelDeviceStatics(factoryPtr)
        }

        return LearningModelDevice.__ILearningModelDeviceStatics.CreateFromDirect3D11Device(device)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the unique identifier for the device.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodeldevice.adapterid
     * @type {DisplayAdapterId} 
     */
    AdapterId {
        get => this.get_AdapterId()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the [IDirect3DDevice](../windows.graphics.directx.direct3d11/idirect3ddevice.md) for the device.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodeldevice.direct3d11device
     * @type {IDirect3DDevice} 
     */
    Direct3D11Device {
        get => this.get_Direct3D11Device()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_AdapterId() {
        if (!this.HasProp("__ILearningModelDevice")) {
            if ((queryResult := this.QueryInterface(ILearningModelDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDevice := ILearningModelDevice(outPtr)
        }

        return this.__ILearningModelDevice.get_AdapterId()
    }

    /**
     * 
     * @returns {IDirect3DDevice} 
     */
    get_Direct3D11Device() {
        if (!this.HasProp("__ILearningModelDevice")) {
            if ((queryResult := this.QueryInterface(ILearningModelDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelDevice := ILearningModelDevice(outPtr)
        }

        return this.__ILearningModelDevice.get_Direct3D11Device()
    }

;@endregion Instance Methods
}
