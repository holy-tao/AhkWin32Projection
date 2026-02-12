#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageManager2Statics.ahk
#Include .\IChatMessageManagerStatics3.ahk
#Include .\IChatMessageManagerStatic.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to message transports and the message store. Also provides a method to display the UI to compose messages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagemanager
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageManager extends IInspectable {
;@region Static Methods
    /**
     * Asynchronously registers the app as a [ChatMessageTransport](chatmessagetransport.md) in order to post messages to the [ChatMessageStore](chatmessagestore.md).
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagemanager.registertransportasync
     */
    static RegisterTransportAsync() {
        if (!ChatMessageManager.HasProp("__IChatMessageManager2Statics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessageManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatMessageManager2Statics.IID)
            ChatMessageManager.__IChatMessageManager2Statics := IChatMessageManager2Statics(factoryPtr)
        }

        return ChatMessageManager.__IChatMessageManager2Statics.RegisterTransportAsync()
    }

    /**
     * Asynchronously gets the[ChatMessageTransport](chatmessagetransport.md).
     * @param {HSTRING} transportId The locally unique identifier for the message transport.
     * @returns {IAsyncOperation<ChatMessageTransport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagemanager.gettransportasync
     */
    static GetTransportAsync(transportId) {
        if (!ChatMessageManager.HasProp("__IChatMessageManager2Statics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessageManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatMessageManager2Statics.IID)
            ChatMessageManager.__IChatMessageManager2Statics := IChatMessageManager2Statics(factoryPtr)
        }

        return ChatMessageManager.__IChatMessageManager2Statics.GetTransportAsync(transportId)
    }

    /**
     * Gets the [ChatSyncManager](chatsyncmanager.md) instance.
     * @returns {IAsyncOperation<ChatSyncManager>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagemanager.requestsyncmanagerasync
     */
    static RequestSyncManagerAsync() {
        if (!ChatMessageManager.HasProp("__IChatMessageManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessageManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatMessageManagerStatics3.IID)
            ChatMessageManager.__IChatMessageManagerStatics3 := IChatMessageManagerStatics3(factoryPtr)
        }

        return ChatMessageManager.__IChatMessageManagerStatics3.RequestSyncManagerAsync()
    }

    /**
     * Asynchronously gets the chat message transports available on the device.
     * @returns {IAsyncOperation<IVectorView<ChatMessageTransport>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagemanager.gettransportsasync
     */
    static GetTransportsAsync() {
        if (!ChatMessageManager.HasProp("__IChatMessageManagerStatic")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessageManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatMessageManagerStatic.IID)
            ChatMessageManager.__IChatMessageManagerStatic := IChatMessageManagerStatic(factoryPtr)
        }

        return ChatMessageManager.__IChatMessageManagerStatic.GetTransportsAsync()
    }

    /**
     * Returns the SMS messaging store for the phone.
     * @remarks
     * The method is invoked as an [IAsyncOperation](/previous-versions/bb776309(v=vs.85)) as shown in the following example:
     * 
     * ```
     * ChatMessageStore store = await ChatMessageManager.RequestStoreAsync();
     * 
     * ```
     * @returns {IAsyncOperation<ChatMessageStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagemanager.requeststoreasync
     */
    static RequestStoreAsync() {
        if (!ChatMessageManager.HasProp("__IChatMessageManagerStatic")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessageManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatMessageManagerStatic.IID)
            ChatMessageManager.__IChatMessageManagerStatic := IChatMessageManagerStatic(factoryPtr)
        }

        return ChatMessageManager.__IChatMessageManagerStatic.RequestStoreAsync()
    }

    /**
     * Shows the compose SMS dialog, pre-populated with data from the supplied [ChatMessage](chatmessage.md) object, allowing the user to send an SMS message.
     * @remarks
     * The [TransportId](chatmessage_transportid.md) property of the message is set to the desired outgoing transport. The [ChatMessage.Body](chatmessage_body.md) property is optionally set to any initial text. The following example shows a call to ShowComposeSmsMessageAsync with the transport and initial text for a message:
     * 
     * ```
     * async void ComposeMessage()
     * {
     *     ChatMessage message;
     *     message.Body = "Sent from *SpiffyChat*: How’s your morning going?";
     *     message.TransportId = "0";
     *     message.Recipients.Add("+12065551234"); 
     * 
     *     await ChatMessageManager.ShowComposeSmsMessageAsync(message);
     * }
     * 
     * ```
     * @param {ChatMessage} message The chat message.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagemanager.showcomposesmsmessageasync
     */
    static ShowComposeSmsMessageAsync(message) {
        if (!ChatMessageManager.HasProp("__IChatMessageManagerStatic")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessageManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatMessageManagerStatic.IID)
            ChatMessageManager.__IChatMessageManagerStatic := IChatMessageManagerStatic(factoryPtr)
        }

        return ChatMessageManager.__IChatMessageManagerStatic.ShowComposeSmsMessageAsync(message)
    }

    /**
     * Launches the device's SMS settings.
     * @remarks
     * The ShowSmsSettings method allows a chat application to launch the SMS settings pane attached to the current UI thread.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagemanager.showsmssettings
     */
    static ShowSmsSettings() {
        if (!ChatMessageManager.HasProp("__IChatMessageManagerStatic")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessageManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatMessageManagerStatic.IID)
            ChatMessageManager.__IChatMessageManagerStatic := IChatMessageManagerStatic(factoryPtr)
        }

        return ChatMessageManager.__IChatMessageManagerStatic.ShowSmsSettings()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
