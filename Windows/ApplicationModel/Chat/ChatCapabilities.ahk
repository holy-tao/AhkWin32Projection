#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the Rich Communication Services (RCS) chat capabilities of a phone number.
 * @remarks
 * Call [ChatCapabilitiesManager.GetCachedCapabilitiesAsync](chatcapabilitiesmanager_getcachedcapabilitiesasync_1447428004.md) or [ChatCapabilitiesManager.GetCapabilitiesFromNetworkAsync](chatcapabilitiesmanager_getcapabilitiesfromnetworkasync_886100284.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilities
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Boolean value indicating if an Rich Communication Services (RCS) capable phone number is online.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilities.isonline
     * @type {Boolean} 
     */
    IsOnline {
        get => this.get_IsOnline()
    }

    /**
     * Gets a Boolean value indicating whether a phone number supports Rich Communication Services (RCS) chat.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilities.ischatcapable
     * @type {Boolean} 
     */
    IsChatCapable {
        get => this.get_IsChatCapable()
    }

    /**
     * Gets a Boolean value indicating if a phone number supports Rich Communication Services (RCS) file transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilities.isfiletransfercapable
     * @type {Boolean} 
     */
    IsFileTransferCapable {
        get => this.get_IsFileTransferCapable()
    }

    /**
     * Gets a Boolean value indicating if a phone number is capable of pushing Rich Communication Services (RCS) geolocation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilities.isgeolocationpushcapable
     * @type {Boolean} 
     */
    IsGeoLocationPushCapable {
        get => this.get_IsGeoLocationPushCapable()
    }

    /**
     * Gets a Boolean value indicating if a phone number supports Rich Communication Services (RCS) integrated messaging.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilities.isintegratedmessagingcapable
     * @type {Boolean} 
     */
    IsIntegratedMessagingCapable {
        get => this.get_IsIntegratedMessagingCapable()
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
    get_IsOnline() {
        if (!this.HasProp("__IChatCapabilities")) {
            if ((queryResult := this.QueryInterface(IChatCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatCapabilities := IChatCapabilities(outPtr)
        }

        return this.__IChatCapabilities.get_IsOnline()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChatCapable() {
        if (!this.HasProp("__IChatCapabilities")) {
            if ((queryResult := this.QueryInterface(IChatCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatCapabilities := IChatCapabilities(outPtr)
        }

        return this.__IChatCapabilities.get_IsChatCapable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFileTransferCapable() {
        if (!this.HasProp("__IChatCapabilities")) {
            if ((queryResult := this.QueryInterface(IChatCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatCapabilities := IChatCapabilities(outPtr)
        }

        return this.__IChatCapabilities.get_IsFileTransferCapable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGeoLocationPushCapable() {
        if (!this.HasProp("__IChatCapabilities")) {
            if ((queryResult := this.QueryInterface(IChatCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatCapabilities := IChatCapabilities(outPtr)
        }

        return this.__IChatCapabilities.get_IsGeoLocationPushCapable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIntegratedMessagingCapable() {
        if (!this.HasProp("__IChatCapabilities")) {
            if ((queryResult := this.QueryInterface(IChatCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatCapabilities := IChatCapabilities(outPtr)
        }

        return this.__IChatCapabilities.get_IsIntegratedMessagingCapable()
    }

;@endregion Instance Methods
}
