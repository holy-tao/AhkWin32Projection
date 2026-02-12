#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxSetAutoReplySettingsRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to set auto-reply settings.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [SetAutoReplySettingsRequested](emaildataproviderconnection_setautoreplysettingsrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsetautoreplysettingsrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxSetAutoReplySettingsRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxSetAutoReplySettingsRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxSetAutoReplySettingsRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxSetAutoReplySettingsRequest](emailmailboxsetautoreplysettingsrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsetautoreplysettingsrequesteventargs.request
     * @type {EmailMailboxSetAutoReplySettingsRequest} 
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
     * @returns {EmailMailboxSetAutoReplySettingsRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxSetAutoReplySettingsRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSetAutoReplySettingsRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSetAutoReplySettingsRequestEventArgs := IEmailMailboxSetAutoReplySettingsRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxSetAutoReplySettingsRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxsetautoreplysettingsrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxSetAutoReplySettingsRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSetAutoReplySettingsRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSetAutoReplySettingsRequestEventArgs := IEmailMailboxSetAutoReplySettingsRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxSetAutoReplySettingsRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
