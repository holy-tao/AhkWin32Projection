#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRcsManagerStatics2.ahk
#Include .\IRcsManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to APIs for handling Rich Communication Services (RCS) messages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsmanager
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsManager extends IInspectable {
;@region Static Methods
    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_TransportListChanged(handler) {
        if (!RcsManager.HasProp("__IRcsManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.RcsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRcsManagerStatics2.IID)
            RcsManager.__IRcsManagerStatics2 := IRcsManagerStatics2(factoryPtr)
        }

        return RcsManager.__IRcsManagerStatics2.add_TransportListChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_TransportListChanged(token) {
        if (!RcsManager.HasProp("__IRcsManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.RcsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRcsManagerStatics2.IID)
            RcsManager.__IRcsManagerStatics2 := IRcsManagerStatics2(factoryPtr)
        }

        return RcsManager.__IRcsManagerStatics2.remove_TransportListChanged(token)
    }

    /**
     * Gets the [RcsEndUserMessageManager](rcsendusermessagemanager.md).
     * @returns {RcsEndUserMessageManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsmanager.getendusermessagemanager
     */
    static GetEndUserMessageManager() {
        if (!RcsManager.HasProp("__IRcsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.RcsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRcsManagerStatics.IID)
            RcsManager.__IRcsManagerStatics := IRcsManagerStatics(factoryPtr)
        }

        return RcsManager.__IRcsManagerStatics.GetEndUserMessageManager()
    }

    /**
     * Gets all instances of [RcsTransport](rcstransport.md).
     * @returns {IAsyncOperation<IVectorView<RcsTransport>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsmanager.gettransportsasync
     */
    static GetTransportsAsync() {
        if (!RcsManager.HasProp("__IRcsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.RcsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRcsManagerStatics.IID)
            RcsManager.__IRcsManagerStatics := IRcsManagerStatics(factoryPtr)
        }

        return RcsManager.__IRcsManagerStatics.GetTransportsAsync()
    }

    /**
     * Gets an instance of [RcsTransport](rcstransport.md) for the specified transport ID.
     * @param {HSTRING} transportId The ID of the transport to retrieve.
     * @returns {IAsyncOperation<RcsTransport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsmanager.gettransportasync
     */
    static GetTransportAsync(transportId) {
        if (!RcsManager.HasProp("__IRcsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.RcsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRcsManagerStatics.IID)
            RcsManager.__IRcsManagerStatics := IRcsManagerStatics(factoryPtr)
        }

        return RcsManager.__IRcsManagerStatics.GetTransportAsync(transportId)
    }

    /**
     * Asynchronously allows a user to leave a particular conversation.
     * @param {ChatConversation} conversation The conversation to leave.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsmanager.leaveconversationasync
     */
    static LeaveConversationAsync(conversation) {
        if (!RcsManager.HasProp("__IRcsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.RcsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRcsManagerStatics.IID)
            RcsManager.__IRcsManagerStatics := IRcsManagerStatics(factoryPtr)
        }

        return RcsManager.__IRcsManagerStatics.LeaveConversationAsync(conversation)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
