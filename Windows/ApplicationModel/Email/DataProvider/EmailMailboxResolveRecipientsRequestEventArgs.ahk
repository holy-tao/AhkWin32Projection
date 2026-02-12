#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxResolveRecipientsRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to resolve a list of recipients.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [ResolveRecipientsRequested](emaildataproviderconnection_resolverecipientsrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxresolverecipientsrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxResolveRecipientsRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxResolveRecipientsRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxResolveRecipientsRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxResolveRecipientsRequest](emailmailboxresolverecipientsrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxresolverecipientsrequesteventargs.request
     * @type {EmailMailboxResolveRecipientsRequest} 
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
     * @returns {EmailMailboxResolveRecipientsRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxResolveRecipientsRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxResolveRecipientsRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxResolveRecipientsRequestEventArgs := IEmailMailboxResolveRecipientsRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxResolveRecipientsRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxresolverecipientsrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxResolveRecipientsRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxResolveRecipientsRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxResolveRecipientsRequestEventArgs := IEmailMailboxResolveRecipientsRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxResolveRecipientsRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
