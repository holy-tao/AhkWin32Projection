#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattReadRequest.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GattReadRequest.ahk
#Include .\GattRequestStateChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This class represents a Bluetooth GATT read request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequest
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattReadRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattReadRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattReadRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the read request offset.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequest.offset
     * @type {Integer} 
     */
    Offset {
        get => this.get_Offset()
    }

    /**
     * Gets the buffer length of the read request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequest.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Gets the read request state.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequest.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * This is an event that is triggered when the read request state was changed.
     * @type {TypedEventHandler<GattReadRequest, GattRequestStateChangedEventArgs>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0246e199-5199-5bdb-919d-8544ce30fd71}"),
                    GattReadRequest,
                    GattRequestStateChangedEventArgs
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Offset() {
        if (!this.HasProp("__IGattReadRequest")) {
            if ((queryResult := this.QueryInterface(IGattReadRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequest := IGattReadRequest(outPtr)
        }

        return this.__IGattReadRequest.get_Offset()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__IGattReadRequest")) {
            if ((queryResult := this.QueryInterface(IGattReadRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequest := IGattReadRequest(outPtr)
        }

        return this.__IGattReadRequest.get_Length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IGattReadRequest")) {
            if ((queryResult := this.QueryInterface(IGattReadRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequest := IGattReadRequest(outPtr)
        }

        return this.__IGattReadRequest.get_State()
    }

    /**
     * 
     * @param {TypedEventHandler<GattReadRequest, GattRequestStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__IGattReadRequest")) {
            if ((queryResult := this.QueryInterface(IGattReadRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequest := IGattReadRequest(outPtr)
        }

        return this.__IGattReadRequest.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__IGattReadRequest")) {
            if ((queryResult := this.QueryInterface(IGattReadRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequest := IGattReadRequest(outPtr)
        }

        return this.__IGattReadRequest.remove_StateChanged(token)
    }

    /**
     * Responds to a read request with a value.
     * @param {IBuffer} value The value to respond with.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequest.respondwithvalue
     */
    RespondWithValue(value) {
        if (!this.HasProp("__IGattReadRequest")) {
            if ((queryResult := this.QueryInterface(IGattReadRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequest := IGattReadRequest(outPtr)
        }

        return this.__IGattReadRequest.RespondWithValue(value)
    }

    /**
     * Responds to the read request with a protocol error.
     * @param {Integer} protocolError The protocol error to send. A list of errors with the byte values can be found in [GattProtocolError](gattprotocolerror.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattreadrequest.respondwithprotocolerror
     */
    RespondWithProtocolError(protocolError) {
        if (!this.HasProp("__IGattReadRequest")) {
            if ((queryResult := this.QueryInterface(IGattReadRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattReadRequest := IGattReadRequest(outPtr)
        }

        return this.__IGattReadRequest.RespondWithProtocolError(protocolError)
    }

;@endregion Instance Methods
}
