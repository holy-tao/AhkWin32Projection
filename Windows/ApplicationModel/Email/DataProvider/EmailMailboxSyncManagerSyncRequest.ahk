#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxSyncManagerSyncRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request from a client to sync a mailbox.
 * @remarks
 * Used in your [MailboxSyncRequested](emaildataproviderconnection_mailboxsyncrequested.md) event handler. Use the instance of this class that's returned by the [EmailMailboxSyncManagerSyncRequestedEventArgs.Request](emailmailboxsyncmanagersyncrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsyncmanagersyncrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxSyncManagerSyncRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxSyncManagerSyncRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxSyncManagerSyncRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID of the mailbox to synchronize.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsyncmanagersyncrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
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
        if (!this.HasProp("__IEmailMailboxSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManagerSyncRequest := IEmailMailboxSyncManagerSyncRequest(outPtr)
        }

        return this.__IEmailMailboxSyncManagerSyncRequest.get_EmailMailboxId()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsyncmanagersyncrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManagerSyncRequest := IEmailMailboxSyncManagerSyncRequest(outPtr)
        }

        return this.__IEmailMailboxSyncManagerSyncRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsyncmanagersyncrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManagerSyncRequest := IEmailMailboxSyncManagerSyncRequest(outPtr)
        }

        return this.__IEmailMailboxSyncManagerSyncRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
