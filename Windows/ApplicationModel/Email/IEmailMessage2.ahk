#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EmailIrmInfo.ahk
#Include .\EmailRecipient.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\EmailMeetingInfo.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMessage2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMessage2
     * @type {Guid}
     */
    static IID => Guid("{fdc8248b-9f1a-44db-bd3c-65c384770f86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_RemoteId", "put_RemoteId", "get_MailboxId", "get_ConversationId", "get_FolderId", "get_AllowInternetImages", "put_AllowInternetImages", "get_ChangeNumber", "get_DownloadState", "put_DownloadState", "get_EstimatedDownloadSizeInBytes", "put_EstimatedDownloadSizeInBytes", "get_FlagState", "put_FlagState", "get_HasPartialBodies", "get_Importance", "put_Importance", "get_InResponseToMessageId", "get_IrmInfo", "put_IrmInfo", "get_IsDraftMessage", "get_IsRead", "put_IsRead", "get_IsSeen", "put_IsSeen", "get_IsServerSearchMessage", "get_IsSmartSendable", "get_MessageClass", "put_MessageClass", "get_NormalizedSubject", "get_OriginalCodePage", "put_OriginalCodePage", "get_Preview", "put_Preview", "get_LastResponseKind", "put_LastResponseKind", "get_Sender", "put_Sender", "get_SentTime", "put_SentTime", "get_MeetingInfo", "put_MeetingInfo", "GetBodyStream", "SetBodyStream"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * @type {HSTRING} 
     */
    MailboxId {
        get => this.get_MailboxId()
    }

    /**
     * @type {HSTRING} 
     */
    ConversationId {
        get => this.get_ConversationId()
    }

    /**
     * @type {HSTRING} 
     */
    FolderId {
        get => this.get_FolderId()
    }

    /**
     * @type {Boolean} 
     */
    AllowInternetImages {
        get => this.get_AllowInternetImages()
        set => this.put_AllowInternetImages(value)
    }

    /**
     * @type {Integer} 
     */
    ChangeNumber {
        get => this.get_ChangeNumber()
    }

    /**
     * @type {Integer} 
     */
    DownloadState {
        get => this.get_DownloadState()
        set => this.put_DownloadState(value)
    }

    /**
     * @type {Integer} 
     */
    EstimatedDownloadSizeInBytes {
        get => this.get_EstimatedDownloadSizeInBytes()
        set => this.put_EstimatedDownloadSizeInBytes(value)
    }

    /**
     * @type {Integer} 
     */
    FlagState {
        get => this.get_FlagState()
        set => this.put_FlagState(value)
    }

    /**
     * @type {Boolean} 
     */
    HasPartialBodies {
        get => this.get_HasPartialBodies()
    }

    /**
     * @type {Integer} 
     */
    Importance {
        get => this.get_Importance()
        set => this.put_Importance(value)
    }

    /**
     * @type {HSTRING} 
     */
    InResponseToMessageId {
        get => this.get_InResponseToMessageId()
    }

    /**
     * @type {EmailIrmInfo} 
     */
    IrmInfo {
        get => this.get_IrmInfo()
        set => this.put_IrmInfo(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDraftMessage {
        get => this.get_IsDraftMessage()
    }

    /**
     * @type {Boolean} 
     */
    IsRead {
        get => this.get_IsRead()
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
    IsServerSearchMessage {
        get => this.get_IsServerSearchMessage()
    }

    /**
     * @type {Boolean} 
     */
    IsSmartSendable {
        get => this.get_IsSmartSendable()
    }

    /**
     * @type {HSTRING} 
     */
    MessageClass {
        get => this.get_MessageClass()
        set => this.put_MessageClass(value)
    }

    /**
     * @type {HSTRING} 
     */
    NormalizedSubject {
        get => this.get_NormalizedSubject()
    }

    /**
     * @type {Integer} 
     */
    OriginalCodePage {
        get => this.get_OriginalCodePage()
        set => this.put_OriginalCodePage(value)
    }

    /**
     * @type {HSTRING} 
     */
    Preview {
        get => this.get_Preview()
        set => this.put_Preview(value)
    }

    /**
     * @type {Integer} 
     */
    LastResponseKind {
        get => this.get_LastResponseKind()
        set => this.put_LastResponseKind(value)
    }

    /**
     * @type {EmailRecipient} 
     */
    Sender {
        get => this.get_Sender()
        set => this.put_Sender(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    SentTime {
        get => this.get_SentTime()
        set => this.put_SentTime(value)
    }

    /**
     * @type {EmailMeetingInfo} 
     */
    MeetingInfo {
        get => this.get_MeetingInfo()
        set => this.put_MeetingInfo(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MailboxId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConversationId() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FolderId() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowInternetImages() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowInternetImages(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeNumber() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadState() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DownloadState(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EstimatedDownloadSizeInBytes() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EstimatedDownloadSizeInBytes(value) {
        result := ComCall(18, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlagState() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FlagState(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPartialBodies() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Importance() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Importance(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InResponseToMessageId() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {EmailIrmInfo} 
     */
    get_IrmInfo() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailIrmInfo(value)
    }

    /**
     * 
     * @param {EmailIrmInfo} value 
     * @returns {HRESULT} 
     */
    put_IrmInfo(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDraftMessage() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRead() {
        result := ComCall(28, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRead(value) {
        result := ComCall(29, this, "int", value, "int")
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
        result := ComCall(30, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSeen(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsServerSearchMessage() {
        result := ComCall(32, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSmartSendable() {
        result := ComCall(33, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MessageClass() {
        value := HSTRING()
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MessageClass(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NormalizedSubject() {
        value := HSTRING()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginalCodePage() {
        result := ComCall(37, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OriginalCodePage(value) {
        result := ComCall(38, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Preview() {
        value := HSTRING()
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Preview(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastResponseKind() {
        result := ComCall(41, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LastResponseKind(value) {
        result := ComCall(42, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {EmailRecipient} 
     */
    get_Sender() {
        result := ComCall(43, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailRecipient(value)
    }

    /**
     * 
     * @param {EmailRecipient} value 
     * @returns {HRESULT} 
     */
    put_Sender(value) {
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_SentTime() {
        result := ComCall(45, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_SentTime(value) {
        result := ComCall(46, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {EmailMeetingInfo} 
     */
    get_MeetingInfo() {
        result := ComCall(47, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMeetingInfo(value)
    }

    /**
     * 
     * @param {EmailMeetingInfo} value 
     * @returns {HRESULT} 
     */
    put_MeetingInfo(value) {
        result := ComCall(48, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {IRandomAccessStreamReference} 
     */
    GetBodyStream(type) {
        result := ComCall(49, this, "int", type, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(result_)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {IRandomAccessStreamReference} stream 
     * @returns {HRESULT} 
     */
    SetBodyStream(type, stream) {
        result := ComCall(50, this, "int", type, "ptr", stream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
