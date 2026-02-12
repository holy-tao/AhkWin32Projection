#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxDownloadMessageRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to download an email message.
 * @remarks
 * Use the instance of this class that is passed as an argument to your [DownloadMessageRequested](emaildataproviderconnection_downloadmessagerequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadmessagerequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxDownloadMessageRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxDownloadMessageRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxDownloadMessageRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxDownloadMessageRequest](emailmailboxdownloadmessagerequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadmessagerequesteventargs.request
     * @type {EmailMailboxDownloadMessageRequest} 
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
     * @returns {EmailMailboxDownloadMessageRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxDownloadMessageRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadMessageRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadMessageRequestEventArgs := IEmailMailboxDownloadMessageRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxDownloadMessageRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadmessagerequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxDownloadMessageRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadMessageRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadMessageRequestEventArgs := IEmailMailboxDownloadMessageRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxDownloadMessageRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
