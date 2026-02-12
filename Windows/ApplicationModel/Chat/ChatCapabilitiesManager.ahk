#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatCapabilitiesManagerStatics.ahk
#Include .\IChatCapabilitiesManagerStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for getting chat capabilities.
 * @remarks
 * Call the [GetCachedCapabilitiesAsync](chatcapabilitiesmanager_getcachedcapabilitiesasync_1447428004.md) or [GetCapabilitiesFromNetworkAsync](chatcapabilitiesmanager_getcapabilitiesfromnetworkasync_886100284.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilitiesmanager
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatCapabilitiesManager extends IInspectable {
;@region Static Methods
    /**
     * Asynchronously gets the locally cached Rich Communication Services (RCS) chat capabilities for the specified phone number through the specified [RcsTransport](rcstransport.md) TransportId.
     * @param {HSTRING} address_ The phone number for which to get the Rich Communication Services (RCS) chat capabilities
     * @returns {IAsyncOperation<ChatCapabilities>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilitiesmanager.getcachedcapabilitiesasync
     */
    static GetCachedCapabilitiesAsync(address_) {
        if (!ChatCapabilitiesManager.HasProp("__IChatCapabilitiesManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatCapabilitiesManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatCapabilitiesManagerStatics.IID)
            ChatCapabilitiesManager.__IChatCapabilitiesManagerStatics := IChatCapabilitiesManagerStatics(factoryPtr)
        }

        return ChatCapabilitiesManager.__IChatCapabilitiesManagerStatics.GetCachedCapabilitiesAsync(address_)
    }

    /**
     * Asynchronously gets the Rich Communication Services (RCS) chat capabilities for the specified phone number through the specified [RcsTransport](rcstransport.md) TransportId from the service provider.
     * @param {HSTRING} address_ The phone number for which to get the Rich Communication Services (RCS) chat capabilities.
     * @returns {IAsyncOperation<ChatCapabilities>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilitiesmanager.getcapabilitiesfromnetworkasync
     */
    static GetCapabilitiesFromNetworkAsync(address_) {
        if (!ChatCapabilitiesManager.HasProp("__IChatCapabilitiesManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatCapabilitiesManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatCapabilitiesManagerStatics.IID)
            ChatCapabilitiesManager.__IChatCapabilitiesManagerStatics := IChatCapabilitiesManagerStatics(factoryPtr)
        }

        return ChatCapabilitiesManager.__IChatCapabilitiesManagerStatics.GetCapabilitiesFromNetworkAsync(address_)
    }

    /**
     * Asynchronously gets the locally cached Rich Communication Services (RCS) chat capabilities for the specified phone number.
     * @param {HSTRING} address_ The phone number for which to get the Rich Communication Services (RCS) chat capabilities
     * @param {HSTRING} transportId 
     * @returns {IAsyncOperation<ChatCapabilities>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilitiesmanager.getcachedcapabilitiesasync
     */
    static GetCachedCapabilitiesForTransportAsync(address_, transportId) {
        if (!ChatCapabilitiesManager.HasProp("__IChatCapabilitiesManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatCapabilitiesManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatCapabilitiesManagerStatics2.IID)
            ChatCapabilitiesManager.__IChatCapabilitiesManagerStatics2 := IChatCapabilitiesManagerStatics2(factoryPtr)
        }

        return ChatCapabilitiesManager.__IChatCapabilitiesManagerStatics2.GetCachedCapabilitiesForTransportAsync(address_, transportId)
    }

    /**
     * Asynchronously gets the Rich Communication Services (RCS) chat capabilities for the specified phone number from the service provider.
     * @param {HSTRING} address_ The phone number for which to get the Rich Communication Services (RCS) chat capabilities.
     * @param {HSTRING} transportId 
     * @returns {IAsyncOperation<ChatCapabilities>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatcapabilitiesmanager.getcapabilitiesfromnetworkasync
     */
    static GetCapabilitiesFromNetworkForTransportAsync(address_, transportId) {
        if (!ChatCapabilitiesManager.HasProp("__IChatCapabilitiesManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatCapabilitiesManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatCapabilitiesManagerStatics2.IID)
            ChatCapabilitiesManager.__IChatCapabilitiesManagerStatics2 := IChatCapabilitiesManagerStatics2(factoryPtr)
        }

        return ChatCapabilitiesManager.__IChatCapabilitiesManagerStatics2.GetCapabilitiesFromNetworkForTransportAsync(address_, transportId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
