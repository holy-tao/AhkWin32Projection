#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShutdownManagerStatics2.ahk
#Include .\IShutdownManagerStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Manages the shutdown of devices that run in fixed-purpose mode.
 * @remarks
 * All methods of this class are static, so you do not need to get a ShutdownManager object to use the methods.
 * 
 * This API requires the use of the IoT **systemManagement** capability. Users can add the following to their **Package.appmanifest**:`
 * <iot:Capability Name="systemManagement"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.system.shutdownmanager
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ShutdownManager extends IInspectable {
;@region Static Methods
    /**
     * Gets whether a given [power state](powerstate.md) is supported on a fixed-purpose device.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * @param {Integer} powerState_ The power state to be examined.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.shutdownmanager.ispowerstatesupported
     */
    static IsPowerStateSupported(powerState_) {
        if (!ShutdownManager.HasProp("__IShutdownManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.ShutdownManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShutdownManagerStatics2.IID)
            ShutdownManager.__IShutdownManagerStatics2 := IShutdownManagerStatics2(factoryPtr)
        }

        return ShutdownManager.__IShutdownManagerStatics2.IsPowerStateSupported(powerState_)
    }

    /**
     * Instructs a fixed-purpose device to enter the given power state.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * @param {Integer} powerState_ The power state to enter.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.shutdownmanager.enterpowerstate
     */
    static EnterPowerState(powerState_) {
        if (!ShutdownManager.HasProp("__IShutdownManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.ShutdownManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShutdownManagerStatics2.IID)
            ShutdownManager.__IShutdownManagerStatics2 := IShutdownManagerStatics2(factoryPtr)
        }

        return ShutdownManager.__IShutdownManagerStatics2.EnterPowerState(powerState_)
    }

    /**
     * Instructs a fixed-purpose device to enter the given power state, then wake up after the given period of time.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * @param {Integer} powerState_ The power state to enter.
     * @param {TimeSpan} wakeUpAfter The period of time to remain in the specified power state. After this time elapses, the device will wake up.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.shutdownmanager.enterpowerstate
     */
    static EnterPowerStateWithTimeSpan(powerState_, wakeUpAfter) {
        if (!ShutdownManager.HasProp("__IShutdownManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.ShutdownManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShutdownManagerStatics2.IID)
            ShutdownManager.__IShutdownManagerStatics2 := IShutdownManagerStatics2(factoryPtr)
        }

        return ShutdownManager.__IShutdownManagerStatics2.EnterPowerStateWithTimeSpan(powerState_, wakeUpAfter)
    }

    /**
     * Shuts down a device that runs in fixed-purpose mode, and optionally restarts the device after the specified number of seconds.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * @param {Integer} shutdownKind_ The type of shutdown to perform, either with or without restarting the device.
     * @param {TimeSpan} timeout The amount of time in seconds to wait before restarting the device if *shutdownKind* is **ShutdownKind.Restart**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.shutdownmanager.beginshutdown
     */
    static BeginShutdown(shutdownKind_, timeout) {
        if (!ShutdownManager.HasProp("__IShutdownManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.ShutdownManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShutdownManagerStatics.IID)
            ShutdownManager.__IShutdownManagerStatics := IShutdownManagerStatics(factoryPtr)
        }

        return ShutdownManager.__IShutdownManagerStatics.BeginShutdown(shutdownKind_, timeout)
    }

    /**
     * Cancels a shutdown of a fixed-purpose device that is already in progress.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.shutdownmanager.cancelshutdown
     */
    static CancelShutdown() {
        if (!ShutdownManager.HasProp("__IShutdownManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.ShutdownManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShutdownManagerStatics.IID)
            ShutdownManager.__IShutdownManagerStatics := IShutdownManagerStatics(factoryPtr)
        }

        return ShutdownManager.__IShutdownManagerStatics.CancelShutdown()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
