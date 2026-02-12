#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxUpdateMeetingResponseRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request from a client to update a meeting response.
 * @remarks
 * Used in your [UpdateMeetingResponseRequested](emaildataproviderconnection_updatemeetingresponserequested.md) event handler. Use the instance of this class that's returned by the [EmailMailboxUpdateMeetingResponseRequestEventArgs.Request](emailmailboxupdatemeetingresponserequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxUpdateMeetingResponseRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxUpdateMeetingResponseRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxUpdateMeetingResponseRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID of the mailbox that holds the meeting response to be updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the message ID of the meeting response to be updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequest.emailmessageid
     * @type {HSTRING} 
     */
    EmailMessageId {
        get => this.get_EmailMessageId()
    }

    /**
     * Gets the response value to be used in updating the meeting response.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequest.response
     * @type {Integer} 
     */
    Response {
        get => this.get_Response()
    }

    /**
     * Gets the subject to be used on the updated meeting response.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequest.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets the comment to be used in updating the meeting response.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequest.comment
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
    }

    /**
     * Gets a value that indicates whether an update should be sent to the meeting owner when the meeting response is updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequest.sendupdate
     * @type {Boolean} 
     */
    SendUpdate {
        get => this.get_SendUpdate()
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
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequest := IEmailMailboxUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailMessageId() {
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequest := IEmailMailboxUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequest.get_EmailMessageId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Response() {
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequest := IEmailMailboxUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequest.get_Response()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequest := IEmailMailboxUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequest.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequest := IEmailMailboxUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequest.get_Comment()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SendUpdate() {
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequest := IEmailMailboxUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequest.get_SendUpdate()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequest := IEmailMailboxUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequest := IEmailMailboxUpdateMeetingResponseRequest(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
