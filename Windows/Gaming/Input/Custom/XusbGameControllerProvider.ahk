#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXusbGameControllerProvider.ahk
#Include .\IGameControllerProvider.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the physical game controller devices connected to the system using XUSB22.SYS.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.xusbgamecontrollerprovider
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class XusbGameControllerProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXusbGameControllerProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXusbGameControllerProvider.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The firmware version of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.xusbgamecontrollerprovider.firmwareversioninfo
     * @type {GameControllerVersionInfo} 
     */
    FirmwareVersionInfo {
        get => this.get_FirmwareVersionInfo()
    }

    /**
     * The hardware product ID of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.xusbgamecontrollerprovider.hardwareproductid
     * @type {Integer} 
     */
    HardwareProductId {
        get => this.get_HardwareProductId()
    }

    /**
     * The hardware vendor ID of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.xusbgamecontrollerprovider.hardwarevendorid
     * @type {Integer} 
     */
    HardwareVendorId {
        get => this.get_HardwareVendorId()
    }

    /**
     * Contains information on the hardware version of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.xusbgamecontrollerprovider.hardwareversioninfo
     * @type {GameControllerVersionInfo} 
     */
    HardwareVersionInfo {
        get => this.get_HardwareVersionInfo()
    }

    /**
     * Boolean indicating whether the controller is connected.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.xusbgamecontrollerprovider.isconnected
     * @type {Boolean} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the speed on the controller's vibration motor.
     * @param {Float} lowFrequencyMotorSpeed The low frequency motor speed.
     * @param {Float} highFrequencyMotorSpeed The high frequency motor speed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.xusbgamecontrollerprovider.setvibration
     */
    SetVibration(lowFrequencyMotorSpeed, highFrequencyMotorSpeed) {
        if (!this.HasProp("__IXusbGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IXusbGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXusbGameControllerProvider := IXusbGameControllerProvider(outPtr)
        }

        return this.__IXusbGameControllerProvider.SetVibration(lowFrequencyMotorSpeed, highFrequencyMotorSpeed)
    }

    /**
     * 
     * @returns {GameControllerVersionInfo} 
     */
    get_FirmwareVersionInfo() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_FirmwareVersionInfo()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareProductId() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_HardwareProductId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareVendorId() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_HardwareVendorId()
    }

    /**
     * 
     * @returns {GameControllerVersionInfo} 
     */
    get_HardwareVersionInfo() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_HardwareVersionInfo()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnected() {
        if (!this.HasProp("__IGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerProvider := IGameControllerProvider(outPtr)
        }

        return this.__IGameControllerProvider.get_IsConnected()
    }

;@endregion Instance Methods
}
