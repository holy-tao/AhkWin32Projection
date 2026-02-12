#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ChatMessageChangeTracker.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ChatMessage.ahk
#Include .\ChatMessageReader.ahk
#Include .\ChatMessageValidationResult.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageStore
     * @type {Guid}
     */
    static IID => Guid("{31f2fd01-ccf6-580b-4976-0a07dd5d3b47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeTracker", "DeleteMessageAsync", "DownloadMessageAsync", "GetMessageAsync", "GetMessageReader1", "GetMessageReader2", "MarkMessageReadAsync", "RetrySendMessageAsync", "SendMessageAsync", "ValidateMessage", "add_MessageChanged", "remove_MessageChanged"]

    /**
     * @type {ChatMessageChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * 
     * @returns {ChatMessageChangeTracker} 
     */
    get_ChangeTracker() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatMessageChangeTracker(value)
    }

    /**
     * 
     * @param {HSTRING} localMessageId 
     * @returns {IAsyncAction} 
     */
    DeleteMessageAsync(localMessageId) {
        if(localMessageId is String) {
            pin := HSTRING.Create(localMessageId)
            localMessageId := pin.Value
        }
        localMessageId := localMessageId is Win32Handle ? NumGet(localMessageId, "ptr") : localMessageId

        result := ComCall(7, this, "ptr", localMessageId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {HSTRING} localChatMessageId 
     * @returns {IAsyncAction} 
     */
    DownloadMessageAsync(localChatMessageId) {
        if(localChatMessageId is String) {
            pin := HSTRING.Create(localChatMessageId)
            localChatMessageId := pin.Value
        }
        localChatMessageId := localChatMessageId is Win32Handle ? NumGet(localChatMessageId, "ptr") : localChatMessageId

        result := ComCall(8, this, "ptr", localChatMessageId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {HSTRING} localChatMessageId 
     * @returns {IAsyncOperation<ChatMessage>} 
     */
    GetMessageAsync(localChatMessageId) {
        if(localChatMessageId is String) {
            pin := HSTRING.Create(localChatMessageId)
            localChatMessageId := pin.Value
        }
        localChatMessageId := localChatMessageId is Win32Handle ? NumGet(localChatMessageId, "ptr") : localChatMessageId

        result := ComCall(9, this, "ptr", localChatMessageId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatMessage, value)
    }

    /**
     * 
     * @returns {ChatMessageReader} 
     */
    GetMessageReader1() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatMessageReader(value)
    }

    /**
     * 
     * @param {TimeSpan} recentTimeLimit 
     * @returns {ChatMessageReader} 
     */
    GetMessageReader2(recentTimeLimit) {
        result := ComCall(11, this, "ptr", recentTimeLimit, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatMessageReader(value)
    }

    /**
     * 
     * @param {HSTRING} localChatMessageId 
     * @returns {IAsyncAction} 
     */
    MarkMessageReadAsync(localChatMessageId) {
        if(localChatMessageId is String) {
            pin := HSTRING.Create(localChatMessageId)
            localChatMessageId := pin.Value
        }
        localChatMessageId := localChatMessageId is Win32Handle ? NumGet(localChatMessageId, "ptr") : localChatMessageId

        result := ComCall(12, this, "ptr", localChatMessageId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {HSTRING} localChatMessageId 
     * @returns {IAsyncAction} 
     */
    RetrySendMessageAsync(localChatMessageId) {
        if(localChatMessageId is String) {
            pin := HSTRING.Create(localChatMessageId)
            localChatMessageId := pin.Value
        }
        localChatMessageId := localChatMessageId is Win32Handle ? NumGet(localChatMessageId, "ptr") : localChatMessageId

        result := ComCall(13, this, "ptr", localChatMessageId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {ChatMessage} chatMessage_ 
     * @returns {IAsyncAction} 
     */
    SendMessageAsync(chatMessage_) {
        result := ComCall(14, this, "ptr", chatMessage_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {ChatMessage} chatMessage_ 
     * @returns {ChatMessageValidationResult} 
     */
    ValidateMessage(chatMessage_) {
        result := ComCall(15, this, "ptr", chatMessage_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatMessageValidationResult(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ChatMessageStore, ChatMessageChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MessageChanged(value) {
        returnValue := EventRegistrationToken()
        result := ComCall(16, this, "ptr", value, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_MessageChanged(value) {
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
