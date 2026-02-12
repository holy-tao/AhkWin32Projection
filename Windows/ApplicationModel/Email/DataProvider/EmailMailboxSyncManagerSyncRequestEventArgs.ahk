#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxSyncManagerSyncRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to sync a mailbox.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [MailboxSyncRequested](emaildataproviderconnection_mailboxsyncrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsyncmanagersyncrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxSyncManagerSyncRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxSyncManagerSyncRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxSyncManagerSyncRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxSyncManagerSyncRequest](emailmailboxsyncmanagersyncrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsyncmanagersyncrequesteventargs.request
     * @type {EmailMailboxSyncManagerSyncRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {EmailMailboxSyncManagerSyncRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxSyncManagerSyncRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManagerSyncRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManagerSyncRequestEventArgs := IEmailMailboxSyncManagerSyncRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxSyncManagerSyncRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsyncmanagersyncrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxSyncManagerSyncRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManagerSyncRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManagerSyncRequestEventArgs := IEmailMailboxSyncManagerSyncRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxSyncManagerSyncRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
