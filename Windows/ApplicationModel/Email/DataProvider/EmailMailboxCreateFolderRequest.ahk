#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxCreateFolderRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to create a folder.
 * @remarks
 * Used in your [CreateFolderRequested](emaildataproviderconnection_createfolderrequested.md) event handler. Use the instance of this class returned by the [EmailMailboxCreateFolderRequestEventArgs.Request](emailmailboxcreatefolderrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxcreatefolderrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxCreateFolderRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxCreateFolderRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxCreateFolderRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox identifier for the mailbox where the new folder should be created.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxcreatefolderrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the folder ID of the parent folder for the created folder.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxcreatefolderrequest.parentfolderid
     * @type {HSTRING} 
     */
    ParentFolderId {
        get => this.get_ParentFolderId()
    }

    /**
     * Gets the name of the folder to be created.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxcreatefolderrequest.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
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
        if (!this.HasProp("__IEmailMailboxCreateFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCreateFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCreateFolderRequest := IEmailMailboxCreateFolderRequest(outPtr)
        }

        return this.__IEmailMailboxCreateFolderRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ParentFolderId() {
        if (!this.HasProp("__IEmailMailboxCreateFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCreateFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCreateFolderRequest := IEmailMailboxCreateFolderRequest(outPtr)
        }

        return this.__IEmailMailboxCreateFolderRequest.get_ParentFolderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IEmailMailboxCreateFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCreateFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCreateFolderRequest := IEmailMailboxCreateFolderRequest(outPtr)
        }

        return this.__IEmailMailboxCreateFolderRequest.get_Name()
    }

    /**
     * Informs the client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the folder was created successfully.
     * @param {EmailFolder} folder_ An [EmailFolder](../windows.applicationmodel.email/emailfolder.md) representing the created folder.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxcreatefolderrequest.reportcompletedasync
     */
    ReportCompletedAsync(folder_) {
        if (!this.HasProp("__IEmailMailboxCreateFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCreateFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCreateFolderRequest := IEmailMailboxCreateFolderRequest(outPtr)
        }

        return this.__IEmailMailboxCreateFolderRequest.ReportCompletedAsync(folder_)
    }

    /**
     * Informs the client that the request was not processed successfully.
     * 
     * Successful completion of the asynchronous action indicates that the status parameter's value reports the reason for failure.
     * @param {Integer} status_ An [EmailMailboxCreateFolderStatus](../windows.applicationmodel.email/emailmailboxcreatefolderstatus.md) value indicating why the operation failed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxcreatefolderrequest.reportfailedasync
     */
    ReportFailedAsync(status_) {
        if (!this.HasProp("__IEmailMailboxCreateFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxCreateFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxCreateFolderRequest := IEmailMailboxCreateFolderRequest(outPtr)
        }

        return this.__IEmailMailboxCreateFolderRequest.ReportFailedAsync(status_)
    }

;@endregion Instance Methods
}
