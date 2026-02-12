#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPwmController.ahk
#Include .\IPwmControllerStatics.ahk
#Include .\IPwmControllerStatics2.ahk
#Include .\IPwmControllerStatics3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a PWM controller connected to the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller
 * @namespace Windows.Devices.Pwm
 * @version WindowsRuntime 1.4
 */
class PwmController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPwmController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPwmController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets all the controllers on the system asynchronously.
     * @param {IPwmProvider} provider The PWM provider that is on the system.
     * @returns {IAsyncOperation<IVectorView<PwmController>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.getcontrollersasync
     */
    static GetControllersAsync(provider) {
        if (!PwmController.HasProp("__IPwmControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Pwm.PwmController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPwmControllerStatics.IID)
            PwmController.__IPwmControllerStatics := IPwmControllerStatics(factoryPtr)
        }

        return PwmController.__IPwmControllerStatics.GetControllersAsync(provider)
    }

    /**
     * Gets the default PWM controller on the system.
     * @returns {IAsyncOperation<PwmController>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!PwmController.HasProp("__IPwmControllerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Pwm.PwmController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPwmControllerStatics2.IID)
            PwmController.__IPwmControllerStatics2 := IPwmControllerStatics2(factoryPtr)
        }

        return PwmController.__IPwmControllerStatics2.GetDefaultAsync()
    }

    /**
     * Retrieves an Advanced Query Syntax (AQS) string for the PWM controller that has the specified friendly name. You can use this string with the [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) method to get [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects for those controllers.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!PwmController.HasProp("__IPwmControllerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Pwm.PwmController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPwmControllerStatics3.IID)
            PwmController.__IPwmControllerStatics3 := IPwmControllerStatics3(factoryPtr)
        }

        return PwmController.__IPwmControllerStatics3.GetDeviceSelector()
    }

    /**
     * Retrieves an Advanced Query Syntax (AQS) string for all the PWM controllers on the system. You can use this string with the [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) method to get [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects for those controllers.
     * @param {HSTRING} friendlyName 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.getdeviceselector
     */
    static GetDeviceSelectorFromFriendlyName(friendlyName) {
        if (!PwmController.HasProp("__IPwmControllerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Pwm.PwmController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPwmControllerStatics3.IID)
            PwmController.__IPwmControllerStatics3 := IPwmControllerStatics3(factoryPtr)
        }

        return PwmController.__IPwmControllerStatics3.GetDeviceSelectorFromFriendlyName(friendlyName)
    }

    /**
     * Initializes a PWM controller instance based on the given [DeviceInformation ID](/uwp/api/Windows.Devices.Enumeration.DeviceInformation.Id).
     * @param {HSTRING} deviceId The acquired [DeviceInformation ID](/uwp/api/Windows.Devices.Enumeration.DeviceInformation.Id).
     * @returns {IAsyncOperation<PwmController>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!PwmController.HasProp("__IPwmControllerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Pwm.PwmController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPwmControllerStatics3.IID)
            PwmController.__IPwmControllerStatics3 := IPwmControllerStatics3(factoryPtr)
        }

        return PwmController.__IPwmControllerStatics3.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the number of pins available on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.pincount
     * @type {Integer} 
     */
    PinCount {
        get => this.get_PinCount()
    }

    /**
     * Gets the actual frequency of the PWM.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.actualfrequency
     * @type {Float} 
     */
    ActualFrequency {
        get => this.get_ActualFrequency()
    }

    /**
     * Gets the minimum frequency offered by the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.minfrequency
     * @type {Float} 
     */
    MinFrequency {
        get => this.get_MinFrequency()
    }

    /**
     * Gets the maximum frequency offered by the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.maxfrequency
     * @type {Float} 
     */
    MaxFrequency {
        get => this.get_MaxFrequency()
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
    get_PinCount() {
        if (!this.HasProp("__IPwmController")) {
            if ((queryResult := this.QueryInterface(IPwmController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmController := IPwmController(outPtr)
        }

        return this.__IPwmController.get_PinCount()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ActualFrequency() {
        if (!this.HasProp("__IPwmController")) {
            if ((queryResult := this.QueryInterface(IPwmController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmController := IPwmController(outPtr)
        }

        return this.__IPwmController.get_ActualFrequency()
    }

    /**
     * Sets the PWM frequency.
     * @param {Float} desiredFrequency Then value of the desired frequency in Hz.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.setdesiredfrequency
     */
    SetDesiredFrequency(desiredFrequency) {
        if (!this.HasProp("__IPwmController")) {
            if ((queryResult := this.QueryInterface(IPwmController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmController := IPwmController(outPtr)
        }

        return this.__IPwmController.SetDesiredFrequency(desiredFrequency)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinFrequency() {
        if (!this.HasProp("__IPwmController")) {
            if ((queryResult := this.QueryInterface(IPwmController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmController := IPwmController(outPtr)
        }

        return this.__IPwmController.get_MinFrequency()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxFrequency() {
        if (!this.HasProp("__IPwmController")) {
            if ((queryResult := this.QueryInterface(IPwmController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmController := IPwmController(outPtr)
        }

        return this.__IPwmController.get_MaxFrequency()
    }

    /**
     * Opens the pin for use.
     * @param {Integer} pinNumber Which pin to open.
     * @returns {PwmPin} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmcontroller.openpin
     */
    OpenPin(pinNumber) {
        if (!this.HasProp("__IPwmController")) {
            if ((queryResult := this.QueryInterface(IPwmController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmController := IPwmController(outPtr)
        }

        return this.__IPwmController.OpenPin(pinNumber)
    }

;@endregion Instance Methods
}
