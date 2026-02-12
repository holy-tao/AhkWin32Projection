#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILowLevelDevicesController.ahk
#Include .\ILowLevelDevicesControllerStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a low level bus device controller, and its associated provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lowleveldevicescontroller
 * @namespace Windows.Devices
 * @version WindowsRuntime 1.4
 */
class LowLevelDevicesController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILowLevelDevicesController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILowLevelDevicesController.IID

    /**
     * Gets or sets the default provider for the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lowleveldevicescontroller.defaultprovider
     * @type {ILowLevelDevicesAggregateProvider} 
     */
    static DefaultProvider {
        get => LowLevelDevicesController.get_DefaultProvider()
        set => LowLevelDevicesController.put_DefaultProvider(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ILowLevelDevicesAggregateProvider} 
     */
    static get_DefaultProvider() {
        if (!LowLevelDevicesController.HasProp("__ILowLevelDevicesControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.LowLevelDevicesController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILowLevelDevicesControllerStatics.IID)
            LowLevelDevicesController.__ILowLevelDevicesControllerStatics := ILowLevelDevicesControllerStatics(factoryPtr)
        }

        return LowLevelDevicesController.__ILowLevelDevicesControllerStatics.get_DefaultProvider()
    }

    /**
     * 
     * @param {ILowLevelDevicesAggregateProvider} value 
     * @returns {HRESULT} 
     */
    static put_DefaultProvider(value) {
        if (!LowLevelDevicesController.HasProp("__ILowLevelDevicesControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.LowLevelDevicesController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILowLevelDevicesControllerStatics.IID)
            LowLevelDevicesController.__ILowLevelDevicesControllerStatics := ILowLevelDevicesControllerStatics(factoryPtr)
        }

        return LowLevelDevicesController.__ILowLevelDevicesControllerStatics.put_DefaultProvider(value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
