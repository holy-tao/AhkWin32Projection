#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxSetAutoReplySettingsRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to set auto-reply settings.
 * @remarks
 * Used in your [SetAutoReplySettingsRequested](emaildataproviderconnection_setautoreplysettingsrequested.md) event handler. Use the instance of this class that's returned by the [EmailMailboxSetAutoReplySettingsRequestedEventArgs.Request](emailmailboxsetautoreplysettingsrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsetautoreplysettingsrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxSetAutoReplySettingsRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxSetAutoReplySettingsRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxSetAutoReplySettingsRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID whose auto-reply settings are being set.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsetautoreplysettingsrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the new settings.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsetautoreplysettingsrequest.autoreplysettings
     * @type {EmailMailboxAutoReplySettings} 
     */
    AutoReplySettings {
        get => this.get_AutoReplySettings()
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
        if (!this.HasProp("__IEmailMailboxSetAutoReplySettingsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSetAutoReplySettingsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSetAutoReplySettingsRequest := IEmailMailboxSetAutoReplySettingsRequest(outPtr)
        }

        return this.__IEmailMailboxSetAutoReplySettingsRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {EmailMailboxAutoReplySettings} 
     */
    get_AutoReplySettings() {
        if (!this.HasProp("__IEmailMailboxSetAutoReplySettingsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSetAutoReplySettingsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSetAutoReplySettingsRequest := IEmailMailboxSetAutoReplySettingsRequest(outPtr)
        }

        return this.__IEmailMailboxSetAutoReplySettingsRequest.get_AutoReplySettings()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsetautoreplysettingsrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxSetAutoReplySettingsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSetAutoReplySettingsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSetAutoReplySettingsRequest := IEmailMailboxSetAutoReplySettingsRequest(outPtr)
        }

        return this.__IEmailMailboxSetAutoReplySettingsRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsetautoreplysettingsrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxSetAutoReplySettingsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSetAutoReplySettingsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSetAutoReplySettingsRequest := IEmailMailboxSetAutoReplySettingsRequest(outPtr)
        }

        return this.__IEmailMailboxSetAutoReplySettingsRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
