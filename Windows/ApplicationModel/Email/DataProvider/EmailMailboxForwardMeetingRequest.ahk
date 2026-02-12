#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxForwardMeetingRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to forward a meeting invitation.
 * @remarks
 * Used in your [ForwardMeetingRequested](emaildataproviderconnection_forwardmeetingrequested.md) event handler. Use the instance of this class returned by the [EmailMailboxForwardMeetingRequestEventArgs.Request](emailmailboxforwardmeetingrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxForwardMeetingRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxForwardMeetingRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxForwardMeetingRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID for the meeting invitation to be forwarded.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * The message ID of the meeting invitation to be forwarded.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest.emailmessageid
     * @type {HSTRING} 
     */
    EmailMessageId {
        get => this.get_EmailMessageId()
    }

    /**
     * Gets the list of recipients for the forwarded meeting invitation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest.recipients
     * @type {IVectorView<EmailRecipient>} 
     */
    Recipients {
        get => this.get_Recipients()
    }

    /**
     * Gets the subject of the forwarded meeting invitation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets the forward header type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest.forwardheadertype
     * @type {Integer} 
     */
    ForwardHeaderType {
        get => this.get_ForwardHeaderType()
    }

    /**
     * Gets the forward header for the forwarded invitation. The forward header is the set of message headers that appear at the beginning of the email message that holds the invitation. It is only used by data providers that generate emails when forwarding invitations.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest.forwardheader
     * @type {HSTRING} 
     */
    ForwardHeader {
        get => this.get_ForwardHeader()
    }

    /**
     * Gets the comment to be added to the forwarded meeting invitation. When a data provider forwards an invitation as an email message, the comment appears between the forward header and the body of the forwarded invitation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest.comment
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
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
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequest := IEmailMailboxForwardMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailMessageId() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequest := IEmailMailboxForwardMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequest.get_EmailMessageId()
    }

    /**
     * 
     * @returns {IVectorView<EmailRecipient>} 
     */
    get_Recipients() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequest := IEmailMailboxForwardMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequest.get_Recipients()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequest := IEmailMailboxForwardMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequest.get_Subject()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ForwardHeaderType() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequest := IEmailMailboxForwardMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequest.get_ForwardHeaderType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ForwardHeader() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequest := IEmailMailboxForwardMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequest.get_ForwardHeader()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequest := IEmailMailboxForwardMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequest.get_Comment()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the meeting invitation was forwarded successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequest := IEmailMailboxForwardMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequest := IEmailMailboxForwardMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
