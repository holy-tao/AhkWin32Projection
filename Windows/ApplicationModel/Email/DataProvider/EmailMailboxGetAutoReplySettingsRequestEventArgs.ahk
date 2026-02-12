#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxGetAutoReplySettingsRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to get auto-reply settings.
 * @remarks
 * Use the instance of this class that is passed as an argument to your [GetAutoReplySettingsRequested](emaildataproviderconnection_getautoreplysettingsrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxgetautoreplysettingsrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxGetAutoReplySettingsRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxGetAutoReplySettingsRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxGetAutoReplySettingsRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxGetAutoReplySettingsRequest](emailmailboxgetautoreplysettingsrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxgetautoreplysettingsrequesteventargs.request
     * @type {EmailMailboxGetAutoReplySettingsRequest} 
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
     * @returns {EmailMailboxGetAutoReplySettingsRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxGetAutoReplySettingsRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxGetAutoReplySettingsRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxGetAutoReplySettingsRequestEventArgs := IEmailMailboxGetAutoReplySettingsRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxGetAutoReplySettingsRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxgetautoreplysettingsrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxGetAutoReplySettingsRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxGetAutoReplySettingsRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxGetAutoReplySettingsRequestEventArgs := IEmailMailboxGetAutoReplySettingsRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxGetAutoReplySettingsRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
