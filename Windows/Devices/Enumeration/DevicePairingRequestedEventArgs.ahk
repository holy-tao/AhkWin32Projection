#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePairingRequestedEventArgs.ahk
#Include .\IDevicePairingRequestedEventArgs2.ahk
#Include .\IDevicePairingRequestedEventArgs3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePairingRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePairingRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePairingRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DeviceInformation](deviceinformation.md) object associated with this pairing request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.deviceinformation
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * Gets the kind of pairing associated with this pairing event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.pairingkind
     * @type {Integer} 
     */
    PairingKind {
        get => this.get_PairingKind()
    }

    /**
     * Gets the pin associated with a pairing request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.pin
     * @type {HSTRING} 
     */
    Pin {
        get => this.get_Pin()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        if (!this.HasProp("__IDevicePairingRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePairingRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingRequestedEventArgs := IDevicePairingRequestedEventArgs(outPtr)
        }

        return this.__IDevicePairingRequestedEventArgs.get_DeviceInformation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PairingKind() {
        if (!this.HasProp("__IDevicePairingRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePairingRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingRequestedEventArgs := IDevicePairingRequestedEventArgs(outPtr)
        }

        return this.__IDevicePairingRequestedEventArgs.get_PairingKind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pin() {
        if (!this.HasProp("__IDevicePairingRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePairingRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingRequestedEventArgs := IDevicePairingRequestedEventArgs(outPtr)
        }

        return this.__IDevicePairingRequestedEventArgs.get_Pin()
    }

    /**
     * Accepts a [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event and pairs the device with the application.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.accept
     */
    Accept() {
        if (!this.HasProp("__IDevicePairingRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePairingRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingRequestedEventArgs := IDevicePairingRequestedEventArgs(outPtr)
        }

        return this.__IDevicePairingRequestedEventArgs.Accept()
    }

    /**
     * Accepts a [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event and pairs the device with the application. Requires a pin for pairing purposes.
     * @param {HSTRING} pin The pin to use for attempting to pair a device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.accept
     */
    AcceptWithPin(pin) {
        if (!this.HasProp("__IDevicePairingRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePairingRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingRequestedEventArgs := IDevicePairingRequestedEventArgs(outPtr)
        }

        return this.__IDevicePairingRequestedEventArgs.AcceptWithPin(pin)
    }

    /**
     * Requests a [Deferral](../windows.foundation/deferral.md) to support asynchronous operations.
     * @remarks
     * Sometimes it is necessary to create a delay while the user interacts with the application to support a specific [DevicePairingKinds](devicepairingkinds.md) value. For example, with **ProvidePin**, the application needs to wait until the user finishes providing a pin before continuing with the pairing process.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDevicePairingRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePairingRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingRequestedEventArgs := IDevicePairingRequestedEventArgs(outPtr)
        }

        return this.__IDevicePairingRequestedEventArgs.GetDeferral()
    }

    /**
     * Accepts a [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event and pairs the device with the application. Requires a user name and password for pairing purposes.
     * @param {PasswordCredential} passwordCredential_ An object that encapsulates the user name and password for attempting to pair the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.acceptwithpasswordcredential
     */
    AcceptWithPasswordCredential(passwordCredential_) {
        if (!this.HasProp("__IDevicePairingRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDevicePairingRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingRequestedEventArgs2 := IDevicePairingRequestedEventArgs2(outPtr)
        }

        return this.__IDevicePairingRequestedEventArgs2.AcceptWithPasswordCredential(passwordCredential_)
    }

    /**
     * Accepts a [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event with an address, and pairs the device with the application.
     * @param {HSTRING} address_ Your app must provide an address from the device. This is typically used for directed discovery over a network protocol such as IPP or UPnP, where the application already knows the IP/address/URL of the device. You should call **AcceptWithAddress** if you want the pairing to complete. Pass in the address as a parameter.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.acceptwithaddress
     */
    AcceptWithAddress(address_) {
        if (!this.HasProp("__IDevicePairingRequestedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IDevicePairingRequestedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePairingRequestedEventArgs3 := IDevicePairingRequestedEventArgs3(outPtr)
        }

        return this.__IDevicePairingRequestedEventArgs3.AcceptWithAddress(address_)
    }

;@endregion Instance Methods
}
