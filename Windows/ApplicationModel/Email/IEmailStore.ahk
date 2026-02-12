#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\EmailMailbox.ahk
#Include .\EmailConversationReader.ahk
#Include .\EmailMessageReader.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EmailConversation.ahk
#Include .\EmailFolder.ahk
#Include .\EmailMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailStore
     * @type {Guid}
     */
    static IID => Guid("{f803226e-9137-4f8b-a470-279ac3058eb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindMailboxesAsync", "GetConversationReader", "GetConversationReaderWithOptions", "GetMessageReader", "GetMessageReaderWithOptions", "GetMailboxAsync", "GetConversationAsync", "GetFolderAsync", "GetMessageAsync", "CreateMailboxAsync", "CreateMailboxInAccountAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<EmailMailbox>>} 
     */
    FindMailboxesAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, EmailMailbox), result_)
    }

    /**
     * 
     * @returns {EmailConversationReader} 
     */
    GetConversationReader() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
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
        result := ComCall(8, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailConversationReader(result_)
    }

    /**
     * 
     * @returns {EmailMessageReader} 
     */
    GetMessageReader() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
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
        result := ComCall(10, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMessageReader(result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<EmailMailbox>} 
     */
    GetMailboxAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(11, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMailbox, result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<EmailConversation>} 
     */
    GetConversationAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(12, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailConversation, result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<EmailFolder>} 
     */
    GetFolderAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(13, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailFolder, result_)
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

        result := ComCall(14, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMessage, result_)
    }

    /**
     * 
     * @param {HSTRING} accountName 
     * @param {HSTRING} accountAddress 
     * @returns {IAsyncOperation<EmailMailbox>} 
     */
    CreateMailboxAsync(accountName, accountAddress) {
        if(accountName is String) {
            pin := HSTRING.Create(accountName)
            accountName := pin.Value
        }
        accountName := accountName is Win32Handle ? NumGet(accountName, "ptr") : accountName
        if(accountAddress is String) {
            pin := HSTRING.Create(accountAddress)
            accountAddress := pin.Value
        }
        accountAddress := accountAddress is Win32Handle ? NumGet(accountAddress, "ptr") : accountAddress

        result := ComCall(15, this, "ptr", accountName, "ptr", accountAddress, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMailbox, result_)
    }

    /**
     * 
     * @param {HSTRING} accountName 
     * @param {HSTRING} accountAddress 
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<EmailMailbox>} 
     */
    CreateMailboxInAccountAsync(accountName, accountAddress, userDataAccountId) {
        if(accountName is String) {
            pin := HSTRING.Create(accountName)
            accountName := pin.Value
        }
        accountName := accountName is Win32Handle ? NumGet(accountName, "ptr") : accountName
        if(accountAddress is String) {
            pin := HSTRING.Create(accountAddress)
            accountAddress := pin.Value
        }
        accountAddress := accountAddress is Win32Handle ? NumGet(accountAddress, "ptr") : accountAddress
        if(userDataAccountId is String) {
            pin := HSTRING.Create(userDataAccountId)
            userDataAccountId := pin.Value
        }
        userDataAccountId := userDataAccountId is Win32Handle ? NumGet(userDataAccountId, "ptr") : userDataAccountId

        result := ComCall(16, this, "ptr", accountName, "ptr", accountAddress, "ptr", userDataAccountId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMailbox, result_)
    }
}
