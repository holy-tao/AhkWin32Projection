#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastTransmitter.ahk
#Include ..\..\..\Guid.ahk

/**
 * An object that represent a Miracast Transmitter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracasttransmitter
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastTransmitter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastTransmitter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastTransmitter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the name of the Miracast Transmitter.
     * @remarks
     * Miracast Transmitters that have the same name can be distinguished by their Wi-Fi MAC address.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracasttransmitter.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Returns the Miracast Transmitter's current authorization status.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracasttransmitter.authorizationstatus
     * @type {Integer} 
     */
    AuthorizationStatus {
        get => this.get_AuthorizationStatus()
        set => this.put_AuthorizationStatus(value)
    }

    /**
     * Returns the Miracast Transmitter's Wi-Fi MAC address.
     * @remarks
     * Miracast Transmitters that have the same name can be distinguished by their Wi-Fi MAC address.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracasttransmitter.macaddress
     * @type {HSTRING} 
     */
    MacAddress {
        get => this.get_MacAddress()
    }

    /**
     * Returns the time at which this Miracast Transmitter most recently connected.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracasttransmitter.lastconnectiontime
     * @type {DateTime} 
     */
    LastConnectionTime {
        get => this.get_LastConnectionTime()
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
    get_Name() {
        if (!this.HasProp("__IMiracastTransmitter")) {
            if ((queryResult := this.QueryInterface(IMiracastTransmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastTransmitter := IMiracastTransmitter(outPtr)
        }

        return this.__IMiracastTransmitter.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IMiracastTransmitter")) {
            if ((queryResult := this.QueryInterface(IMiracastTransmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastTransmitter := IMiracastTransmitter(outPtr)
        }

        return this.__IMiracastTransmitter.put_Name(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthorizationStatus() {
        if (!this.HasProp("__IMiracastTransmitter")) {
            if ((queryResult := this.QueryInterface(IMiracastTransmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastTransmitter := IMiracastTransmitter(outPtr)
        }

        return this.__IMiracastTransmitter.get_AuthorizationStatus()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AuthorizationStatus(value) {
        if (!this.HasProp("__IMiracastTransmitter")) {
            if ((queryResult := this.QueryInterface(IMiracastTransmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastTransmitter := IMiracastTransmitter(outPtr)
        }

        return this.__IMiracastTransmitter.put_AuthorizationStatus(value)
    }

    /**
     * Returns a collection of [MiracastReceiverConnection](miracastreceiverconnection.md) objects that are associated with the current Miracast Transmitter.
     * @returns {IVectorView<MiracastReceiverConnection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracasttransmitter.getconnections
     */
    GetConnections() {
        if (!this.HasProp("__IMiracastTransmitter")) {
            if ((queryResult := this.QueryInterface(IMiracastTransmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastTransmitter := IMiracastTransmitter(outPtr)
        }

        return this.__IMiracastTransmitter.GetConnections()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MacAddress() {
        if (!this.HasProp("__IMiracastTransmitter")) {
            if ((queryResult := this.QueryInterface(IMiracastTransmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastTransmitter := IMiracastTransmitter(outPtr)
        }

        return this.__IMiracastTransmitter.get_MacAddress()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastConnectionTime() {
        if (!this.HasProp("__IMiracastTransmitter")) {
            if ((queryResult := this.QueryInterface(IMiracastTransmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastTransmitter := IMiracastTransmitter(outPtr)
        }

        return this.__IMiracastTransmitter.get_LastConnectionTime()
    }

;@endregion Instance Methods
}
