#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ChatMessage.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ChatConversation.ahk
#Include .\ChatConversationReader.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\ChatSearchReader.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageStore2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageStore2
     * @type {Guid}
     */
    static IID => Guid("{ad4dc4ee-3ad4-491b-b311-abdf9bb22768}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ForwardMessageAsync", "GetConversationAsync", "GetConversationForTransportsAsync", "GetConversationFromThreadingInfoAsync", "GetConversationReader", "GetConversationForTransportsReader", "GetMessageByRemoteIdAsync", "GetUnseenCountAsync", "GetUnseenCountForTransportsReaderAsync", "MarkAsSeenAsync", "MarkAsSeenForTransportsAsync", "GetSearchReader", "SaveMessageAsync", "TryCancelDownloadMessageAsync", "TryCancelSendMessageAsync", "add_StoreChanged", "remove_StoreChanged"]

    /**
     * 
     * @param {HSTRING} localChatMessageId 
     * @param {IIterable<HSTRING>} addresses 
     * @returns {IAsyncOperation<ChatMessage>} 
     */
    ForwardMessageAsync(localChatMessageId, addresses) {
        if(localChatMessageId is String) {
            pin := HSTRING.Create(localChatMessageId)
            localChatMessageId := pin.Value
        }
        localChatMessageId := localChatMessageId is Win32Handle ? NumGet(localChatMessageId, "ptr") : localChatMessageId

        result := ComCall(6, this, "ptr", localChatMessageId, "ptr", addresses, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatMessage, result_)
    }

    /**
     * 
     * @param {HSTRING} conversationId 
     * @returns {IAsyncOperation<ChatConversation>} 
     */
    GetConversationAsync(conversationId) {
        if(conversationId is String) {
            pin := HSTRING.Create(conversationId)
            conversationId := pin.Value
        }
        conversationId := conversationId is Win32Handle ? NumGet(conversationId, "ptr") : conversationId

        result := ComCall(7, this, "ptr", conversationId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatConversation, result_)
    }

    /**
     * 
     * @param {HSTRING} conversationId 
     * @param {IIterable<HSTRING>} transportIds 
     * @returns {IAsyncOperation<ChatConversation>} 
     */
    GetConversationForTransportsAsync(conversationId, transportIds) {
        if(conversationId is String) {
            pin := HSTRING.Create(conversationId)
            conversationId := pin.Value
        }
        conversationId := conversationId is Win32Handle ? NumGet(conversationId, "ptr") : conversationId

        result := ComCall(8, this, "ptr", conversationId, "ptr", transportIds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatConversation, result_)
    }

    /**
     * 
     * @param {ChatConversationThreadingInfo} threadingInfo 
     * @returns {IAsyncOperation<ChatConversation>} 
     */
    GetConversationFromThreadingInfoAsync(threadingInfo) {
        result := ComCall(9, this, "ptr", threadingInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatConversation, result_)
    }

    /**
     * 
     * @returns {ChatConversationReader} 
     */
    GetConversationReader() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatConversationReader(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} transportIds 
     * @returns {ChatConversationReader} 
     */
    GetConversationForTransportsReader(transportIds) {
        result := ComCall(11, this, "ptr", transportIds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatConversationReader(result_)
    }

    /**
     * 
     * @param {HSTRING} transportId 
     * @param {HSTRING} remoteId 
     * @returns {IAsyncOperation<ChatMessage>} 
     */
    GetMessageByRemoteIdAsync(transportId, remoteId) {
        if(transportId is String) {
            pin := HSTRING.Create(transportId)
            transportId := pin.Value
        }
        transportId := transportId is Win32Handle ? NumGet(transportId, "ptr") : transportId
        if(remoteId is String) {
            pin := HSTRING.Create(remoteId)
            remoteId := pin.Value
        }
        remoteId := remoteId is Win32Handle ? NumGet(remoteId, "ptr") : remoteId

        result := ComCall(12, this, "ptr", transportId, "ptr", remoteId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatMessage, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetUnseenCountAsync() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} transportIds 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetUnseenCountForTransportsReaderAsync(transportIds) {
        result := ComCall(14, this, "ptr", transportIds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    MarkAsSeenAsync() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} transportIds 
     * @returns {IAsyncAction} 
     */
    MarkAsSeenForTransportsAsync(transportIds) {
        result := ComCall(16, this, "ptr", transportIds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {ChatQueryOptions} value 
     * @returns {ChatSearchReader} 
     */
    GetSearchReader(value) {
        result := ComCall(17, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatSearchReader(result_)
    }

    /**
     * 
     * @param {ChatMessage} chatMessage_ 
     * @returns {IAsyncAction} 
     */
    SaveMessageAsync(chatMessage_) {
        result := ComCall(18, this, "ptr", chatMessage_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} localChatMessageId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryCancelDownloadMessageAsync(localChatMessageId) {
        if(localChatMessageId is String) {
            pin := HSTRING.Create(localChatMessageId)
            localChatMessageId := pin.Value
        }
        localChatMessageId := localChatMessageId is Win32Handle ? NumGet(localChatMessageId, "ptr") : localChatMessageId

        result := ComCall(19, this, "ptr", localChatMessageId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {HSTRING} localChatMessageId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryCancelSendMessageAsync(localChatMessageId) {
        if(localChatMessageId is String) {
            pin := HSTRING.Create(localChatMessageId)
            localChatMessageId := pin.Value
        }
        localChatMessageId := localChatMessageId is Win32Handle ? NumGet(localChatMessageId, "ptr") : localChatMessageId

        result := ComCall(20, this, "ptr", localChatMessageId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {TypedEventHandler<ChatMessageStore, ChatMessageStoreChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StoreChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(21, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StoreChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(22, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
