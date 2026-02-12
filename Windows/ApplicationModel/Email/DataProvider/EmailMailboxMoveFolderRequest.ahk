#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxMoveFolderRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to move a folder.
 * @remarks
 * Used in your [MoveFolderRequested](emaildataproviderconnection_movefolderrequested.md) event handler. Use the instance of this class that's returned by the [EmailMailboxMoveFolderRequestEventArgs.Request](emailmailboxmovefolderrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxMoveFolderRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxMoveFolderRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxMoveFolderRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID of the mailbox containing the folder to be moved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the folder ID of the folder to be moved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequest.emailfolderid
     * @type {HSTRING} 
     */
    EmailFolderId {
        get => this.get_EmailFolderId()
    }

    /**
     * Gets the parent folder ID of the new parent folder.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequest.newparentfolderid
     * @type {HSTRING} 
     */
    NewParentFolderId {
        get => this.get_NewParentFolderId()
    }

    /**
     * Gets the new folder name of the file to be moved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequest.newfoldername
     * @type {HSTRING} 
     */
    NewFolderName {
        get => this.get_NewFolderName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailMailboxId() {
        if (!this.HasProp("__IEmailMailboxMoveFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxMoveFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxMoveFolderRequest := IEmailMailboxMoveFolderRequest(outPtr)
        }

        return this.__IEmailMailboxMoveFolderRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailFolderId() {
        if (!this.HasProp("__IEmailMailboxMoveFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxMoveFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxMoveFolderRequest := IEmailMailboxMoveFolderRequest(outPtr)
        }

        return this.__IEmailMailboxMoveFolderRequest.get_EmailFolderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NewParentFolderId() {
        if (!this.HasProp("__IEmailMailboxMoveFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxMoveFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxMoveFolderRequest := IEmailMailboxMoveFolderRequest(outPtr)
        }

        return this.__IEmailMailboxMoveFolderRequest.get_NewParentFolderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NewFolderName() {
        if (!this.HasProp("__IEmailMailboxMoveFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxMoveFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxMoveFolderRequest := IEmailMailboxMoveFolderRequest(outPtr)
        }

        return this.__IEmailMailboxMoveFolderRequest.get_NewFolderName()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the folder was moved successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxMoveFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxMoveFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxMoveFolderRequest := IEmailMailboxMoveFolderRequest(outPtr)
        }

        return this.__IEmailMailboxMoveFolderRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxmovefolderrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxMoveFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxMoveFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxMoveFolderRequest := IEmailMailboxMoveFolderRequest(outPtr)
        }

        return this.__IEmailMailboxMoveFolderRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
