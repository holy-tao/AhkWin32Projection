#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPenDevice.ahk
#Include .\IPenDevice2.ahk
#Include .\IPenDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports the ability to identify and track connected pen devices.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pendevice
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class PenDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPenDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPenDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Obtains a [PenDevice](pendevice.md) object associated with the specified pointer, if available.
     * @param {Integer} pointerId The unique pointer identifier associated with the pointer event.
     * @returns {PenDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pendevice.getfrompointerid
     */
    static GetFromPointerId(pointerId) {
        if (!PenDevice.HasProp("__IPenDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.PenDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPenDeviceStatics.IID)
            PenDevice.__IPenDeviceStatics := IPenDeviceStatics(factoryPtr)
        }

        return PenDevice.__IPenDeviceStatics.GetFromPointerId(pointerId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the unique identifier of the digital pen represented by the [PenDevice](pendevice.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pendevice.penid
     * @type {Guid} 
     */
    PenId {
        get => this.get_PenId()
    }

    /**
     * Gets a single haptic input device that can be used to enumerate the haptic waveforms supported by the associated [PenDevice](pendevice.md) and trigger a specific haptic response.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pendevice.simplehapticscontroller
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
     * @returns {Guid} 
     */
    get_PenId() {
        if (!this.HasProp("__IPenDevice")) {
            if ((queryResult := this.QueryInterface(IPenDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenDevice := IPenDevice(outPtr)
        }

        return this.__IPenDevice.get_PenId()
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        if (!this.HasProp("__IPenDevice2")) {
            if ((queryResult := this.QueryInterface(IPenDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenDevice2 := IPenDevice2(outPtr)
        }

        return this.__IPenDevice2.get_SimpleHapticsController()
    }

;@endregion Instance Methods
}
