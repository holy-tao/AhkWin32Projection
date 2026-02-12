#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVibrationDevice.ahk
#Include .\IVibrationDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to a device that supports vibration notifications only.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.vibrationdevice
 * @namespace Windows.Devices.Haptics
 * @version WindowsRuntime 1.4
 */
class VibrationDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVibrationDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVibrationDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously retrieves the access status of the vibration device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.vibrationdevice.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!VibrationDevice.HasProp("__IVibrationDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.VibrationDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVibrationDeviceStatics.IID)
            VibrationDevice.__IVibrationDeviceStatics := IVibrationDeviceStatics(factoryPtr)
        }

        return VibrationDevice.__IVibrationDeviceStatics.RequestAccessAsync()
    }

    /**
     * Returns the class selection string that you can use to enumerate vibration devices.
     * @remarks
     * You can enumerate vibration devices by passing the class selection string returned by the GetDeviceSelector() method to [FindAllAsync()](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) or [CreateWatcher()](../windows.devices.enumeration/deviceinformation_createwatcher_1506431823.md) method.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.vibrationdevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!VibrationDevice.HasProp("__IVibrationDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.VibrationDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVibrationDeviceStatics.IID)
            VibrationDevice.__IVibrationDeviceStatics := IVibrationDeviceStatics(factoryPtr)
        }

        return VibrationDevice.__IVibrationDeviceStatics.GetDeviceSelector()
    }

    /**
     * Asynchronously retrieves the vibration device specified.
     * @param {HSTRING} deviceId The Global Unique Identifier (GUID) used to identify a single input device.
     * @returns {IAsyncOperation<VibrationDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.vibrationdevice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!VibrationDevice.HasProp("__IVibrationDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.VibrationDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVibrationDeviceStatics.IID)
            VibrationDevice.__IVibrationDeviceStatics := IVibrationDeviceStatics(factoryPtr)
        }

        return VibrationDevice.__IVibrationDeviceStatics.FromIdAsync(deviceId)
    }

    /**
     * Asynchronously retrieves the default vibration device.
     * @returns {IAsyncOperation<VibrationDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.vibrationdevice.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!VibrationDevice.HasProp("__IVibrationDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.VibrationDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVibrationDeviceStatics.IID)
            VibrationDevice.__IVibrationDeviceStatics := IVibrationDeviceStatics(factoryPtr)
        }

        return VibrationDevice.__IVibrationDeviceStatics.GetDefaultAsync()
    }

    /**
     * Asynchronously retrieves all vibration devices detected.
     * @returns {IAsyncOperation<IVectorView<VibrationDevice>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.vibrationdevice.findallasync
     */
    static FindAllAsync() {
        if (!VibrationDevice.HasProp("__IVibrationDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.VibrationDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVibrationDeviceStatics.IID)
            VibrationDevice.__IVibrationDeviceStatics := IVibrationDeviceStatics(factoryPtr)
        }

        return VibrationDevice.__IVibrationDeviceStatics.FindAllAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the identifier for the vibration device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.vibrationdevice.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a reference to a [SimpleHapticsController](simplehapticscontroller.md) object to specify haptic feedback behavior.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.vibrationdevice.simplehapticscontroller
     * @type {SimpleHapticsController} 
     */
    SimpleHapticsController {
        get => this.get_SimpleHapticsController()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IVibrationDevice")) {
            if ((queryResult := this.QueryInterface(IVibrationDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVibrationDevice := IVibrationDevice(outPtr)
        }

        return this.__IVibrationDevice.get_Id()
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        if (!this.HasProp("__IVibrationDevice")) {
            if ((queryResult := this.QueryInterface(IVibrationDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVibrationDevice := IVibrationDevice(outPtr)
        }

        return this.__IVibrationDevice.get_SimpleHapticsController()
    }

;@endregion Instance Methods
}
