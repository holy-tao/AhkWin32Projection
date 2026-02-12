#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxProposeNewTimeForMeetingRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to propose a new time for a meeting.
 * @remarks
 * Used in your [ProposeNewTimeForMeetingRequested](emaildataproviderconnection_proposenewtimeformeetingrequested.md) event handler. Use the instance of this class that's returned by the [EmailMailboxProposeNewTimeForMeetingRequestEventArgs.Request](emailmailboxproposenewtimeformeetingrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxProposeNewTimeForMeetingRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxProposeNewTimeForMeetingRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxProposeNewTimeForMeetingRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID to use to send the proposed new meeting time.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the message ID of the meeting invitation for which a new time is being proposed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequest.emailmessageid
     * @type {HSTRING} 
     */
    EmailMessageId {
        get => this.get_EmailMessageId()
    }

    /**
     * Gets the proposed new start time for the meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequest.newstarttime
     * @type {DateTime} 
     */
    NewStartTime {
        get => this.get_NewStartTime()
    }

    /**
     * Gets the proposed new duration of the meeting.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequest.newduration
     * @type {TimeSpan} 
     */
    NewDuration {
        get => this.get_NewDuration()
    }

    /**
     * Gets the subject of the proposal for a new meeting time.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequest.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets the comment to be added to the proposal for a new meeting time.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequest.comment
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
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequest := IEmailMailboxProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailMessageId() {
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequest := IEmailMailboxProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequest.get_EmailMessageId()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_NewStartTime() {
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequest := IEmailMailboxProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequest.get_NewStartTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NewDuration() {
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequest := IEmailMailboxProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequest.get_NewDuration()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequest := IEmailMailboxProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequest.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequest := IEmailMailboxProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequest.get_Comment()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the proposal was sent successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequest := IEmailMailboxProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequest := IEmailMailboxProposeNewTimeForMeetingRequest(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
