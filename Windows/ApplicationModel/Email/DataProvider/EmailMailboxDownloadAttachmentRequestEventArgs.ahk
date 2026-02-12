#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxDownloadAttachmentRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to download an attachment.
 * @remarks
 * Use the instance of this class that is passed as an argument to your [DownloadAttachmentRequested](emaildataproviderconnection_downloadattachmentrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadattachmentrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxDownloadAttachmentRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxDownloadAttachmentRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxDownloadAttachmentRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxDownloadAttachmentRequest](emailmailboxdownloadattachmentrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadattachmentrequesteventargs.request
     * @type {EmailMailboxDownloadAttachmentRequest} 
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
     * @returns {EmailMailboxDownloadAttachmentRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxDownloadAttachmentRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadAttachmentRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadAttachmentRequestEventArgs := IEmailMailboxDownloadAttachmentRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxDownloadAttachmentRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadattachmentrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxDownloadAttachmentRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadAttachmentRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadAttachmentRequestEventArgs := IEmailMailboxDownloadAttachmentRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxDownloadAttachmentRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
