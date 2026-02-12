#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageTransportConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents data about the chat message transport.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransportconfiguration
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageTransportConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageTransportConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageTransportConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum attachment limit for a message on the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransportconfiguration.maxattachmentcount
     * @type {Integer} 
     */
    MaxAttachmentCount {
        get => this.get_MaxAttachmentCount()
    }

    /**
     * Gets the maximum size of an attachment for the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransportconfiguration.maxmessagesizeinkilobytes
     * @type {Integer} 
     */
    MaxMessageSizeInKilobytes {
        get => this.get_MaxMessageSizeInKilobytes()
    }

    /**
     * Gets the maximum number of recipients for the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransportconfiguration.maxrecipientcount
     * @type {Integer} 
     */
    MaxRecipientCount {
        get => this.get_MaxRecipientCount()
    }

    /**
     * Gets the supported video encoding format for the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransportconfiguration.supportedvideoformat
     * @type {MediaEncodingProfile} 
     */
    SupportedVideoFormat {
        get => this.get_SupportedVideoFormat()
    }

    /**
     * Gets the extended properties of the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagetransportconfiguration.extendedproperties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxAttachmentCount() {
        if (!this.HasProp("__IChatMessageTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransportConfiguration := IChatMessageTransportConfiguration(outPtr)
        }

        return this.__IChatMessageTransportConfiguration.get_MaxAttachmentCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxMessageSizeInKilobytes() {
        if (!this.HasProp("__IChatMessageTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransportConfiguration := IChatMessageTransportConfiguration(outPtr)
        }

        return this.__IChatMessageTransportConfiguration.get_MaxMessageSizeInKilobytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxRecipientCount() {
        if (!this.HasProp("__IChatMessageTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransportConfiguration := IChatMessageTransportConfiguration(outPtr)
        }

        return this.__IChatMessageTransportConfiguration.get_MaxRecipientCount()
    }

    /**
     * 
     * @returns {MediaEncodingProfile} 
     */
    get_SupportedVideoFormat() {
        if (!this.HasProp("__IChatMessageTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransportConfiguration := IChatMessageTransportConfiguration(outPtr)
        }

        return this.__IChatMessageTransportConfiguration.get_SupportedVideoFormat()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_ExtendedProperties() {
        if (!this.HasProp("__IChatMessageTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IChatMessageTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageTransportConfiguration := IChatMessageTransportConfiguration(outPtr)
        }

        return this.__IChatMessageTransportConfiguration.get_ExtendedProperties()
    }

;@endregion Instance Methods
}
