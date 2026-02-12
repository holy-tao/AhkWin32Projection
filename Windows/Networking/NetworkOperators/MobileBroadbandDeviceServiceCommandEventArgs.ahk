#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandDeviceServiceCommandEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event args for the [MobileBroadbandDeviceServiceCommandSession.CommandReceived](./mobilebroadbanddeviceservicecommandsession_commandreceived.md) event. Represents a Device Service Event Received Event Result.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandeventargs
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceServiceCommandEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandDeviceServiceCommandEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandDeviceServiceCommandEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique Device Identifier of the [MobileBroadbandModem](./mobilebroadbandmodem.md) device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandeventargs.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the unique Device Service Identifier for the Device Service.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandeventargs.deviceserviceid
     * @type {Guid} 
     */
    DeviceServiceId {
        get => this.get_DeviceServiceId()
    }

    /**
     * Gets the unique Event Identifier for the Device Service trigger event.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandeventargs.eventid
     * @type {Integer} 
     */
    EventId {
        get => this.get_EventId()
    }

    /**
     * Gets the raw data for the Device Service notification. The caller is responsible for interpreting the data.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandeventargs.receiveddata
     * @type {IBuffer} 
     */
    ReceivedData {
        get => this.get_ReceivedData()
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
    get_DeviceId() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandEventArgs := IMobileBroadbandDeviceServiceCommandEventArgs(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandEventArgs.get_DeviceId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DeviceServiceId() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandEventArgs := IMobileBroadbandDeviceServiceCommandEventArgs(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandEventArgs.get_DeviceServiceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventId() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandEventArgs := IMobileBroadbandDeviceServiceCommandEventArgs(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandEventArgs.get_EventId()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ReceivedData() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandEventArgs := IMobileBroadbandDeviceServiceCommandEventArgs(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandEventArgs.get_ReceivedData()
    }

;@endregion Instance Methods
}
