#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxProposeNewTimeForMeetingRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to propose a new time for a meeting.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [ProposeNewTimeForMeetingRequested](emaildataproviderconnection_proposenewtimeformeetingrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxProposeNewTimeForMeetingRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxProposeNewTimeForMeetingRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxProposeNewTimeForMeetingRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets [EmailMailboxProposeNewTimeForMeetingRequest](emailmailboxproposenewtimeformeetingrequest.md) the object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequesteventargs.request
     * @type {EmailMailboxProposeNewTimeForMeetingRequest} 
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
     * @returns {EmailMailboxProposeNewTimeForMeetingRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequestEventArgs := IEmailMailboxProposeNewTimeForMeetingRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxproposenewtimeformeetingrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxProposeNewTimeForMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxProposeNewTimeForMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxProposeNewTimeForMeetingRequestEventArgs := IEmailMailboxProposeNewTimeForMeetingRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxProposeNewTimeForMeetingRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
