#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRcsTransport.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RcsTransport.ahk
#Include .\RcsServiceKindSupportedChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides functionality for accessing the Rich Communication Services (RCS) transport.
 * @remarks
 * Call [RcsManager.GetTransportAsync](rcsmanager_gettransportasync_455003223.md) or [RcsManager.GetTransportsAsync](rcsmanager_gettransportsasync_998895362.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransport
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsTransport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRcsTransport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRcsTransport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a name-value pair for extensibility of service provider configuration values.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransport.extendedproperties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * Gets a Boolean value indicating if the transport is active.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransport.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Gets the friendly name of the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransport.transportfriendlyname
     * @type {HSTRING} 
     */
    TransportFriendlyName {
        get => this.get_TransportFriendlyName()
    }

    /**
     * Gets the ID for the transport that is unique on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransport.transportid
     * @type {HSTRING} 
     */
    TransportId {
        get => this.get_TransportId()
    }

    /**
     * Gets a configuration object that describes the transport settings.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransport.configuration
     * @type {RcsTransportConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Occurs when the service capabilities change.
     * @type {TypedEventHandler<RcsTransport, RcsServiceKindSupportedChangedEventArgs>}
    */
    OnServiceKindSupportedChanged {
        get {
            if(!this.HasProp("__OnServiceKindSupportedChanged")){
                this.__OnServiceKindSupportedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e5f1c3a4-e498-50b0-91fe-94ebb01de0ab}"),
                    RcsTransport,
                    RcsServiceKindSupportedChangedEventArgs
                )
                this.__OnServiceKindSupportedChangedToken := this.add_ServiceKindSupportedChanged(this.__OnServiceKindSupportedChanged.iface)
            }
            return this.__OnServiceKindSupportedChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnServiceKindSupportedChangedToken")) {
            this.remove_ServiceKindSupportedChanged(this.__OnServiceKindSupportedChangedToken)
            this.__OnServiceKindSupportedChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_ExtendedProperties() {
        if (!this.HasProp("__IRcsTransport")) {
            if ((queryResult := this.QueryInterface(IRcsTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransport := IRcsTransport(outPtr)
        }

        return this.__IRcsTransport.get_ExtendedProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IRcsTransport")) {
            if ((queryResult := this.QueryInterface(IRcsTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransport := IRcsTransport(outPtr)
        }

        return this.__IRcsTransport.get_IsActive()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportFriendlyName() {
        if (!this.HasProp("__IRcsTransport")) {
            if ((queryResult := this.QueryInterface(IRcsTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransport := IRcsTransport(outPtr)
        }

        return this.__IRcsTransport.get_TransportFriendlyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportId() {
        if (!this.HasProp("__IRcsTransport")) {
            if ((queryResult := this.QueryInterface(IRcsTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransport := IRcsTransport(outPtr)
        }

        return this.__IRcsTransport.get_TransportId()
    }

    /**
     * 
     * @returns {RcsTransportConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IRcsTransport")) {
            if ((queryResult := this.QueryInterface(IRcsTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransport := IRcsTransport(outPtr)
        }

        return this.__IRcsTransport.get_Configuration()
    }

    /**
     * Gets a Boolean value indicating if the specified service kind supports store and forward functionality.
     * @param {Integer} serviceKind The service kind to check for store and forward functionality.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransport.isstoreandforwardenabled
     */
    IsStoreAndForwardEnabled(serviceKind) {
        if (!this.HasProp("__IRcsTransport")) {
            if ((queryResult := this.QueryInterface(IRcsTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransport := IRcsTransport(outPtr)
        }

        return this.__IRcsTransport.IsStoreAndForwardEnabled(serviceKind)
    }

    /**
     * Gets a Boolean value indicating if the specified service kind is supported, such as chat, group chat, file transfer, and so on.
     * @param {Integer} serviceKind The service kind to verify.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransport.isservicekindsupported
     */
    IsServiceKindSupported(serviceKind) {
        if (!this.HasProp("__IRcsTransport")) {
            if ((queryResult := this.QueryInterface(IRcsTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransport := IRcsTransport(outPtr)
        }

        return this.__IRcsTransport.IsServiceKindSupported(serviceKind)
    }

    /**
     * 
     * @param {TypedEventHandler<RcsTransport, RcsServiceKindSupportedChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ServiceKindSupportedChanged(handler) {
        if (!this.HasProp("__IRcsTransport")) {
            if ((queryResult := this.QueryInterface(IRcsTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransport := IRcsTransport(outPtr)
        }

        return this.__IRcsTransport.add_ServiceKindSupportedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ServiceKindSupportedChanged(token) {
        if (!this.HasProp("__IRcsTransport")) {
            if ((queryResult := this.QueryInterface(IRcsTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransport := IRcsTransport(outPtr)
        }

        return this.__IRcsTransport.remove_ServiceKindSupportedChanged(token)
    }

;@endregion Instance Methods
}
