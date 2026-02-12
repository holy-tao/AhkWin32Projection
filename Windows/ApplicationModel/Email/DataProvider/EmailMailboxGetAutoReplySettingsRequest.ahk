#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxGetAutoReplySettingsRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to get auto-reply settings.
 * @remarks
 * Used in your [GetAutoReplySettingsRequested](emaildataproviderconnection_getautoreplysettingsrequested.md) event handler. Use the instance of this class returned by the [EmailMailboxGetAutoReplySettingsRequestEventArgs.Request](emailmailboxgetautoreplysettingsrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxgetautoreplysettingsrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxGetAutoReplySettingsRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxGetAutoReplySettingsRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxGetAutoReplySettingsRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the email box ID of the mailbox whose settings are being retrieved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxgetautoreplysettingsrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the requested format of the auto-reply settings.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxgetautoreplysettingsrequest.requestedformat
     * @type {Integer} 
     */
    RequestedFormat {
        get => this.get_RequestedFormat()
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
        if (!this.HasProp("__IEmailMailboxGetAutoReplySettingsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxGetAutoReplySettingsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxGetAutoReplySettingsRequest := IEmailMailboxGetAutoReplySettingsRequest(outPtr)
        }

        return this.__IEmailMailboxGetAutoReplySettingsRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedFormat() {
        if (!this.HasProp("__IEmailMailboxGetAutoReplySettingsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxGetAutoReplySettingsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxGetAutoReplySettingsRequest := IEmailMailboxGetAutoReplySettingsRequest(outPtr)
        }

        return this.__IEmailMailboxGetAutoReplySettingsRequest.get_RequestedFormat()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the *autoReplySettings* parameter contains the retrieved auto-reply settings.
     * @param {EmailMailboxAutoReplySettings} autoReplySettings The requested settings, in the requested format.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxgetautoreplysettingsrequest.reportcompletedasync
     */
    ReportCompletedAsync(autoReplySettings) {
        if (!this.HasProp("__IEmailMailboxGetAutoReplySettingsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxGetAutoReplySettingsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxGetAutoReplySettingsRequest := IEmailMailboxGetAutoReplySettingsRequest(outPtr)
        }

        return this.__IEmailMailboxGetAutoReplySettingsRequest.ReportCompletedAsync(autoReplySettings)
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxgetautoreplysettingsrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxGetAutoReplySettingsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxGetAutoReplySettingsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxGetAutoReplySettingsRequest := IEmailMailboxGetAutoReplySettingsRequest(outPtr)
        }

        return this.__IEmailMailboxGetAutoReplySettingsRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
