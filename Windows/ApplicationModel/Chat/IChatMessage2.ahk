#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ChatConversationThreadingInfo.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\ChatRecipientDeliveryInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessage2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessage2
     * @type {Guid}
     */
    static IID => Guid("{86668332-543f-49f5-ac71-6c2afc6565fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EstimatedDownloadSize", "put_EstimatedDownloadSize", "put_From", "get_IsAutoReply", "put_IsAutoReply", "put_IsForwardingDisabled", "get_IsReplyDisabled", "put_IsIncoming", "put_IsRead", "get_IsSeen", "put_IsSeen", "get_IsSimMessage", "put_LocalTimestamp", "get_MessageKind", "put_MessageKind", "get_MessageOperatorKind", "put_MessageOperatorKind", "put_NetworkTimestamp", "get_IsReceivedDuringQuietHours", "put_IsReceivedDuringQuietHours", "put_RemoteId", "put_Status", "put_Subject", "get_ShouldSuppressNotification", "put_ShouldSuppressNotification", "get_ThreadingInfo", "put_ThreadingInfo", "get_RecipientsDeliveryInfos"]

    /**
     * @type {Integer} 
     */
    EstimatedDownloadSize {
        get => this.get_EstimatedDownloadSize()
        set => this.put_EstimatedDownloadSize(value)
    }

    /**
     * @type {HRESULT} 
     */
    From {
        set => this.put_From(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAutoReply {
        get => this.get_IsAutoReply()
        set => this.put_IsAutoReply(value)
    }

    /**
     * @type {HRESULT} 
     */
    IsForwardingDisabled {
        set => this.put_IsForwardingDisabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsReplyDisabled {
        get => this.get_IsReplyDisabled()
    }

    /**
     * @type {HRESULT} 
     */
    IsIncoming {
        set => this.put_IsIncoming(value)
    }

    /**
     * @type {HRESULT} 
     */
    IsRead {
        set => this.put_IsRead(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSeen {
        get => this.get_IsSeen()
        set => this.put_IsSeen(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSimMessage {
        get => this.get_IsSimMessage()
    }

    /**
     * @type {HRESULT} 
     */
    LocalTimestamp {
        set => this.put_LocalTimestamp(value)
    }

    /**
     * @type {Integer} 
     */
    MessageKind {
        get => this.get_MessageKind()
        set => this.put_MessageKind(value)
    }

    /**
     * @type {Integer} 
     */
    MessageOperatorKind {
        get => this.get_MessageOperatorKind()
        set => this.put_MessageOperatorKind(value)
    }

    /**
     * @type {HRESULT} 
     */
    NetworkTimestamp {
        set => this.put_NetworkTimestamp(value)
    }

    /**
     * @type {Boolean} 
     */
    IsReceivedDuringQuietHours {
        get => this.get_IsReceivedDuringQuietHours()
        set => this.put_IsReceivedDuringQuietHours(value)
    }

    /**
     * @type {HRESULT} 
     */
    RemoteId {
        set => this.put_RemoteId(value)
    }

    /**
     * @type {HRESULT} 
     */
    Status {
        set => this.put_Status(value)
    }

    /**
     * @type {HRESULT} 
     */
    Subject {
        set => this.put_Subject(value)
    }

    /**
     * @type {Boolean} 
     */
    ShouldSuppressNotification {
        get => this.get_ShouldSuppressNotification()
        set => this.put_ShouldSuppressNotification(value)
    }

    /**
     * @type {ChatConversationThreadingInfo} 
     */
    ThreadingInfo {
        get => this.get_ThreadingInfo()
        set => this.put_ThreadingInfo(value)
    }

    /**
     * @type {IVector<ChatRecipientDeliveryInfo>} 
     */
    RecipientsDeliveryInfos {
        get => this.get_RecipientsDeliveryInfos()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EstimatedDownloadSize() {
        result := ComCall(6, this, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EstimatedDownloadSize(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutoReply() {
        result := ComCall(9, this, "int*", &result_ := 0, "int")
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
    put_IsAutoReply(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsForwardingDisabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReplyDisabled() {
        result := ComCall(12, this, "int*", &result_ := 0, "int")
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
    put_IsIncoming(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRead(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeen() {
        result := ComCall(15, this, "int*", &result_ := 0, "int")
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
    put_IsSeen(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSimMessage() {
        result := ComCall(17, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LocalTimestamp(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageKind() {
        result := ComCall(19, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MessageKind(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageOperatorKind() {
        result := ComCall(21, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MessageOperatorKind(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_NetworkTimestamp(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReceivedDuringQuietHours() {
        result := ComCall(24, this, "int*", &result_ := 0, "int")
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
    put_IsReceivedDuringQuietHours(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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

        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldSuppressNotification() {
        result := ComCall(29, this, "int*", &result_ := 0, "int")
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
    put_ShouldSuppressNotification(value) {
        result := ComCall(30, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ChatConversationThreadingInfo} 
     */
    get_ThreadingInfo() {
        result := ComCall(31, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatConversationThreadingInfo(result_)
    }

    /**
     * 
     * @param {ChatConversationThreadingInfo} value 
     * @returns {HRESULT} 
     */
    put_ThreadingInfo(value) {
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<ChatRecipientDeliveryInfo>} 
     */
    get_RecipientsDeliveryInfos() {
        result := ComCall(33, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ChatRecipientDeliveryInfo, result_)
    }
}
