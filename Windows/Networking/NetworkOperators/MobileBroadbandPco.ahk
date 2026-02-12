#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandPco.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class representing a Protocol Configuration Options information element (PCO). The purpose of a PCO is, during a packet data protocol (PDP) context activation, to transfer the external network protocol options associated with the activation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpco
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPco extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandPco

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandPco.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * From the modem, gets the details of the protocol configuration options (PCO) as set by you as the mobile network operator (MNO). Your MNO app should be able to understand this payload. It should decode the data, and control the modem accordingly (for example, turn off the radio, or isolate the modem).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpco.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets a value indicating whether the data received from the modem is complete, or is a subset of the Protocol Configuration Options (PCO) data structure.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpco.iscomplete
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * Gets the [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) of the mobile broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpco.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IMobileBroadbandPco")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPco.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPco := IMobileBroadbandPco(outPtr)
        }

        return this.__IMobileBroadbandPco.get_Data()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        if (!this.HasProp("__IMobileBroadbandPco")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPco.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPco := IMobileBroadbandPco(outPtr)
        }

        return this.__IMobileBroadbandPco.get_IsComplete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IMobileBroadbandPco")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPco.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPco := IMobileBroadbandPco(outPtr)
        }

        return this.__IMobileBroadbandPco.get_DeviceId()
    }

;@endregion Instance Methods
}
