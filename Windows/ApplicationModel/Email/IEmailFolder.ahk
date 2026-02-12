#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\EmailFolder.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\EmailConversationReader.ahk
#Include .\EmailMessage.ahk
#Include .\EmailMessageReader.ahk
#Include .\EmailItemCounts.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailFolder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailFolder
     * @type {Guid}
     */
    static IID => Guid("{a24f7771-996c-4864-b1ba-ed1240e57d11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_RemoteId", "put_RemoteId", "get_MailboxId", "get_ParentFolderId", "get_DisplayName", "put_DisplayName", "get_IsSyncEnabled", "put_IsSyncEnabled", "get_LastSuccessfulSyncTime", "put_LastSuccessfulSyncTime", "get_Kind", "CreateFolderAsync", "DeleteAsync", "FindChildFoldersAsync", "GetConversationReader", "GetConversationReaderWithOptions", "GetMessageAsync", "GetMessageReader", "GetMessageReaderWithOptions", "GetMessageCountsAsync", "TryMoveAsync", "TryMoveWithNewNameAsync", "TrySaveAsync", "SaveMessageAsync"]

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
    ParentFolderId {
        get => this.get_ParentFolderId()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSyncEnabled {
        get => this.get_IsSyncEnabled()
        set => this.put_IsSyncEnabled(value)
    }

    /**
     * @type {DateTime} 
     */
    LastSuccessfulSyncTime {
        get => this.get_LastSuccessfulSyncTime()
        set => this.put_LastSuccessfulSyncTime(value)
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
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
    get_ParentFolderId() {
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
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
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
    put_DisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSyncEnabled() {
        result := ComCall(13, this, "int*", &value := 0, "int")
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
    put_IsSyncEnabled(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastSuccessfulSyncTime() {
        value := DateTime()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastSuccessfulSyncTime(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IAsyncOperation<EmailFolder>} 
     */
    CreateFolderAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(18, this, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailFolder, result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAsync() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<EmailFolder>>} 
     */
    FindChildFoldersAsync() {
        result := ComCall(20, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, EmailFolder), result_)
    }

    /**
     * 
     * @returns {EmailConversationReader} 
     */
    GetConversationReader() {
        result := ComCall(21, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailConversationReader(result_)
    }

    /**
     * 
     * @param {EmailQueryOptions} options 
     * @returns {EmailConversationReader} 
     */
    GetConversationReaderWithOptions(options) {
        result := ComCall(22, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailConversationReader(result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<EmailMessage>} 
     */
    GetMessageAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(23, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMessage, result_)
    }

    /**
     * 
     * @returns {EmailMessageReader} 
     */
    GetMessageReader() {
        result := ComCall(24, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMessageReader(result_)
    }

    /**
     * 
     * @param {EmailQueryOptions} options 
     * @returns {EmailMessageReader} 
     */
    GetMessageReaderWithOptions(options) {
        result := ComCall(25, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMessageReader(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<EmailItemCounts>} 
     */
    GetMessageCountsAsync() {
        result := ComCall(26, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailItemCounts, result_)
    }

    /**
     * 
     * @param {EmailFolder} newParentFolder 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryMoveAsync(newParentFolder) {
        result := ComCall(27, this, "ptr", newParentFolder, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {EmailFolder} newParentFolder 
     * @param {HSTRING} newFolderName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryMoveWithNewNameAsync(newParentFolder, newFolderName) {
        if(newFolderName is String) {
            pin := HSTRING.Create(newFolderName)
            newFolderName := pin.Value
        }
        newFolderName := newFolderName is Win32Handle ? NumGet(newFolderName, "ptr") : newFolderName

        result := ComCall(28, this, "ptr", newParentFolder, "ptr", newFolderName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySaveAsync() {
        result := ComCall(29, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {EmailMessage} message 
     * @returns {IAsyncAction} 
     */
    SaveMessageAsync(message) {
        result := ComCall(30, this, "ptr", message, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
