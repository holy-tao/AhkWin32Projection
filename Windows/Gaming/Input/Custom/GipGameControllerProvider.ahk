#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGipGameControllerProvider.ahk
#Include .\IGameControllerProvider.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a physical game controller connected to the system using GIP.SYS.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipgamecontrollerprovider
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class GipGameControllerProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGipGameControllerProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGipGameControllerProvider.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The firmware version of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipgamecontrollerprovider.firmwareversioninfo
     * @type {GameControllerVersionInfo} 
     */
    FirmwareVersionInfo {
        get => this.get_FirmwareVersionInfo()
    }

    /**
     * The hardware product ID of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipgamecontrollerprovider.hardwareproductid
     * @type {Integer} 
     */
    HardwareProductId {
        get => this.get_HardwareProductId()
    }

    /**
     * The hardware vendor ID of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipgamecontrollerprovider.hardwarevendorid
     * @type {Integer} 
     */
    HardwareVendorId {
        get => this.get_HardwareVendorId()
    }

    /**
     * Contains information on the hardware version of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipgamecontrollerprovider.hardwareversioninfo
     * @type {GameControllerVersionInfo} 
     */
    HardwareVersionInfo {
        get => this.get_HardwareVersionInfo()
    }

    /**
     * Boolean value indicating whether the controller is connected.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipgamecontrollerprovider.isconnected
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
     * Sends a message.
     * @param {Integer} messageClass The class of the message.
     * @param {Integer} messageId The ID of the message.
     * @param {Integer} messageBuffer_length 
     * @param {Pointer<Integer>} messageBuffer A buffer holding the message contents.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipgamecontrollerprovider.sendmessage
     */
    SendMessage(messageClass, messageId, messageBuffer_length, messageBuffer) {
        if (!this.HasProp("__IGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGipGameControllerProvider := IGipGameControllerProvider(outPtr)
        }

        return this.__IGipGameControllerProvider.SendMessage(messageClass, messageId, messageBuffer_length, messageBuffer)
    }

    /**
     * Sends a request for a message.
     * @param {Integer} messageClass The class of the message.
     * @param {Integer} messageId The ID of the message.
     * @param {Integer} requestMessageBuffer_length 
     * @param {Pointer<Integer>} requestMessageBuffer A buffer containing the request.
     * @param {Pointer<Integer>} responseMessageBuffer_length 
     * @param {Pointer<Pointer<Integer>>} responseMessageBuffer A buffer that will contain the request response.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipgamecontrollerprovider.sendreceivemessage
     */
    SendReceiveMessage(messageClass, messageId, requestMessageBuffer_length, requestMessageBuffer, responseMessageBuffer_length, responseMessageBuffer) {
        if (!this.HasProp("__IGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGipGameControllerProvider := IGipGameControllerProvider(outPtr)
        }

        return this.__IGipGameControllerProvider.SendReceiveMessage(messageClass, messageId, requestMessageBuffer_length, requestMessageBuffer, responseMessageBuffer_length, responseMessageBuffer)
    }

    /**
     * Attempts to asynchronously update the firmware for the controller.
     * @param {IInputStream} firmwareImage A stream pointing to the firmware image with which to update the controller.
     * @returns {IAsyncOperationWithProgress<GipFirmwareUpdateResult, GipFirmwareUpdateProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipgamecontrollerprovider.updatefirmwareasync
     */
    UpdateFirmwareAsync(firmwareImage) {
        if (!this.HasProp("__IGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(IGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGipGameControllerProvider := IGipGameControllerProvider(outPtr)
        }

        return this.__IGipGameControllerProvider.UpdateFirmwareAsync(firmwareImage)
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
