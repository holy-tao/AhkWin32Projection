#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\ChatConversationThreadingInfo.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\ChatMessageReader.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatConversation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatConversation
     * @type {Guid}
     */
    static IID => Guid("{a58c080d-1a6f-46dc-8f3d-f5028660b6ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasUnreadMessages", "get_Id", "get_Subject", "put_Subject", "get_IsConversationMuted", "put_IsConversationMuted", "get_MostRecentMessageId", "get_Participants", "get_ThreadingInfo", "DeleteAsync", "GetMessageReader", "MarkAllMessagesAsReadAsync", "MarkMessagesAsReadAsync1", "SaveAsync", "NotifyLocalParticipantComposing", "NotifyRemoteParticipantComposing", "add_RemoteParticipantComposingChanged", "remove_RemoteParticipantComposingChanged"]

    /**
     * @type {Boolean} 
     */
    HasUnreadMessages {
        get => this.get_HasUnreadMessages()
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * @type {Boolean} 
     */
    IsConversationMuted {
        get => this.get_IsConversationMuted()
        set => this.put_IsConversationMuted(value)
    }

    /**
     * @type {HSTRING} 
     */
    MostRecentMessageId {
        get => this.get_MostRecentMessageId()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    Participants {
        get => this.get_Participants()
    }

    /**
     * @type {ChatConversationThreadingInfo} 
     */
    ThreadingInfo {
        get => this.get_ThreadingInfo()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasUnreadMessages() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subject(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConversationMuted() {
        result := ComCall(10, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsConversationMuted(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MostRecentMessageId() {
        result_ := HSTRING()
        result := ComCall(12, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Participants() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {ChatConversationThreadingInfo} 
     */
    get_ThreadingInfo() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatConversationThreadingInfo(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAsync() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {ChatMessageReader} 
     */
    GetMessageReader() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatMessageReader(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    MarkAllMessagesAsReadAsync() {
        result := ComCall(17, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {IAsyncAction} 
     */
    MarkMessagesAsReadAsync1(value) {
        result := ComCall(18, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} transportId 
     * @param {HSTRING} participantAddress 
     * @param {Boolean} isComposing 
     * @returns {HRESULT} 
     */
    NotifyLocalParticipantComposing(transportId, participantAddress, isComposing) {
        if(transportId is String) {
            pin := HSTRING.Create(transportId)
            transportId := pin.Value
        }
        transportId := transportId is Win32Handle ? NumGet(transportId, "ptr") : transportId
        if(participantAddress is String) {
            pin := HSTRING.Create(participantAddress)
            participantAddress := pin.Value
        }
        participantAddress := participantAddress is Win32Handle ? NumGet(participantAddress, "ptr") : participantAddress

        result := ComCall(20, this, "ptr", transportId, "ptr", participantAddress, "int", isComposing, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} transportId 
     * @param {HSTRING} participantAddress 
     * @param {Boolean} isComposing 
     * @returns {HRESULT} 
     */
    NotifyRemoteParticipantComposing(transportId, participantAddress, isComposing) {
        if(transportId is String) {
            pin := HSTRING.Create(transportId)
            transportId := pin.Value
        }
        transportId := transportId is Win32Handle ? NumGet(transportId, "ptr") : transportId
        if(participantAddress is String) {
            pin := HSTRING.Create(participantAddress)
            participantAddress := pin.Value
        }
        participantAddress := participantAddress is Win32Handle ? NumGet(participantAddress, "ptr") : participantAddress

        result := ComCall(21, this, "ptr", transportId, "ptr", participantAddress, "int", isComposing, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ChatConversation, RemoteParticipantComposingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RemoteParticipantComposingChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(22, this, "ptr", handler, "ptr", token, "int")
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
    remove_RemoteParticipantComposingChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
