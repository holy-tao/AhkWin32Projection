#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageTransport.ahk
#Include .\IChatMessageTransport2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the identity of a transport for sending and receiving messages. Physically, a chat message transport is a SIM slot on the phone.
 * @remarks
 * Obtain an instance of this class by calling [GetTransportsAsync](chatmessagemanager_gettransportsasync_998895362.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransport
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageTransport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageTransport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageTransport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Boolean value that indicates whether the current application is set as the messaging notification provider.
     * @remarks
     * **True** if the application is set as the notification provider for the transport, otherwise **False**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransport.isappsetasnotificationprovider
     * @type {Boolean} 
     */
    IsAppSetAsNotificationProvider {
        get => this.get_IsAppSetAsNotificationProvider()
    }

    /**
     * Gets a Boolean value that indicates whether the messaging transport is active.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransport.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Gets a descriptive name identifying the messaging transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransport.transportfriendlyname
     * @type {HSTRING} 
     */
    TransportFriendlyName {
        get => this.get_TransportFriendlyName()
    }

    /**
     * Gets the messaging transport’s identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransport.transportid
     * @type {HSTRING} 
     */
    TransportId {
        get => this.get_TransportId()
    }

    /**
     * Gets the configuration of the message transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransport.configuration
     * @type {ChatMessageTransportConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets the type of the message transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransport.transportkind
     * @type {Integer} 
     */
    TransportKind {
        get => this.get_TransportKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAppSetAsNotificationProvider() {
        if (!this.HasProp("__IChatMessageTransport")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransport := IChatMessageTransport(outPtr)
        }

        return this.__IChatMessageTransport.get_IsAppSetAsNotificationProvider()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IChatMessageTransport")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransport := IChatMessageTransport(outPtr)
        }

        return this.__IChatMessageTransport.get_IsActive()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportFriendlyName() {
        if (!this.HasProp("__IChatMessageTransport")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransport := IChatMessageTransport(outPtr)
        }

        return this.__IChatMessageTransport.get_TransportFriendlyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportId() {
        if (!this.HasProp("__IChatMessageTransport")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransport := IChatMessageTransport(outPtr)
        }

        return this.__IChatMessageTransport.get_TransportId()
    }

    /**
     * Sets the current application to handle messaging notifications.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransport.requestsetasnotificationproviderasync
     */
    RequestSetAsNotificationProviderAsync() {
        if (!this.HasProp("__IChatMessageTransport")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransport := IChatMessageTransport(outPtr)
        }

        return this.__IChatMessageTransport.RequestSetAsNotificationProviderAsync()
    }

    /**
     * 
     * @returns {ChatMessageTransportConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IChatMessageTransport2")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransport2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransport2 := IChatMessageTransport2(outPtr)
        }

        return this.__IChatMessageTransport2.get_Configuration()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportKind() {
        if (!this.HasProp("__IChatMessageTransport2")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransport2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransport2 := IChatMessageTransport2(outPtr)
        }

        return this.__IChatMessageTransport2.get_TransportKind()
    }

;@endregion Instance Methods
}
