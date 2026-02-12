#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\EmailRecipient.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\EmailMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailConversation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailConversation
     * @type {Guid}
     */
    static IID => Guid("{da18c248-a0bc-4349-902d-90f66389f51b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_MailboxId", "get_FlagState", "get_HasAttachment", "get_Importance", "get_LastEmailResponseKind", "get_MessageCount", "get_MostRecentMessageId", "get_MostRecentMessageTime", "get_Preview", "get_LatestSender", "get_Subject", "get_UnreadMessageCount", "FindMessagesAsync", "FindMessagesWithCountAsync"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    MailboxId {
        get => this.get_MailboxId()
    }

    /**
     * @type {Integer} 
     */
    FlagState {
        get => this.get_FlagState()
    }

    /**
     * @type {Boolean} 
     */
    HasAttachment {
        get => this.get_HasAttachment()
    }

    /**
     * @type {Integer} 
     */
    Importance {
        get => this.get_Importance()
    }

    /**
     * @type {Integer} 
     */
    LastEmailResponseKind {
        get => this.get_LastEmailResponseKind()
    }

    /**
     * @type {Integer} 
     */
    MessageCount {
        get => this.get_MessageCount()
    }

    /**
     * @type {HSTRING} 
     */
    MostRecentMessageId {
        get => this.get_MostRecentMessageId()
    }

    /**
     * @type {DateTime} 
     */
    MostRecentMessageTime {
        get => this.get_MostRecentMessageTime()
    }

    /**
     * @type {HSTRING} 
     */
    Preview {
        get => this.get_Preview()
    }

    /**
     * @type {EmailRecipient} 
     */
    LatestSender {
        get => this.get_LatestSender()
    }

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * @type {Integer} 
     */
    UnreadMessageCount {
        get => this.get_UnreadMessageCount()
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
    get_MailboxId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlagState() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasAttachment() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastEmailResponseKind() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageCount() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MostRecentMessageId() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_MostRecentMessageTime() {
        value := DateTime()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Preview() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {EmailRecipient} 
     */
    get_LatestSender() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailRecipient(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnreadMessageCount() {
        result := ComCall(18, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<EmailMessage>>} 
     */
    FindMessagesAsync() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, EmailMessage), result_)
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {IAsyncOperation<IVectorView<EmailMessage>>} 
     */
    FindMessagesWithCountAsync(count) {
        result := ComCall(20, this, "uint", count, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, EmailMessage), result_)
    }
}
