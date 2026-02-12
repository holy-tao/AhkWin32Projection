#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattWriteRequest.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GattWriteRequest.ahk
#Include .\GattRequestStateChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This class represents a GATT write request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequest
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattWriteRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattWriteRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattWriteRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the buffer value of the write request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequest.value
     * @type {IBuffer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets the offset.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequest.offset
     * @type {Integer} 
     */
    Offset {
        get => this.get_Offset()
    }

    /**
     * Gets the write request option.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequest.option
     * @type {Integer} 
     */
    Option {
        get => this.get_Option()
    }

    /**
     * Gets the state of the write request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequest.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * An event that is triggered when the state of the write request has changed.
     * @type {TypedEventHandler<GattWriteRequest, GattRequestStateChangedEventArgs>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7744c6bc-cdcd-5283-9e4f-2e21b49a2ef2}"),
                    GattWriteRequest,
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
     * @returns {IBuffer} 
     */
    get_Value() {
        if (!this.HasProp("__IGattWriteRequest")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequest := IGattWriteRequest(outPtr)
        }

        return this.__IGattWriteRequest.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Offset() {
        if (!this.HasProp("__IGattWriteRequest")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequest := IGattWriteRequest(outPtr)
        }

        return this.__IGattWriteRequest.get_Offset()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Option() {
        if (!this.HasProp("__IGattWriteRequest")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequest := IGattWriteRequest(outPtr)
        }

        return this.__IGattWriteRequest.get_Option()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IGattWriteRequest")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequest := IGattWriteRequest(outPtr)
        }

        return this.__IGattWriteRequest.get_State()
    }

    /**
     * 
     * @param {TypedEventHandler<GattWriteRequest, GattRequestStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__IGattWriteRequest")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequest := IGattWriteRequest(outPtr)
        }

        return this.__IGattWriteRequest.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__IGattWriteRequest")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequest := IGattWriteRequest(outPtr)
        }

        return this.__IGattWriteRequest.remove_StateChanged(token)
    }

    /**
     * Responds to the write request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequest.respond
     */
    Respond() {
        if (!this.HasProp("__IGattWriteRequest")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequest := IGattWriteRequest(outPtr)
        }

        return this.__IGattWriteRequest.Respond()
    }

    /**
     * Responds with a protocol error.
     * @param {Integer} protocolError The GATT protocol error.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattwriterequest.respondwithprotocolerror
     */
    RespondWithProtocolError(protocolError) {
        if (!this.HasProp("__IGattWriteRequest")) {
            if ((queryResult := this.QueryInterface(IGattWriteRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattWriteRequest := IGattWriteRequest(outPtr)
        }

        return this.__IGattWriteRequest.RespondWithProtocolError(protocolError)
    }

;@endregion Instance Methods
}
