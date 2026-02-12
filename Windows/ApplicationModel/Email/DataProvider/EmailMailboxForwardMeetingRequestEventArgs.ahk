#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxForwardMeetingRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to forward a meeting invitation.
 * @remarks
 * Use the instance of the class that is passed as an argument to your [ForwardMeetingRequested](emaildataproviderconnection_forwardmeetingrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxForwardMeetingRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxForwardMeetingRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxForwardMeetingRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxForwardMeetingRequest](emailmailboxforwardmeetingrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequesteventargs.request
     * @type {EmailMailboxForwardMeetingRequest} 
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
     * @returns {EmailMailboxForwardMeetingRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequestEventArgs := IEmailMailboxForwardMeetingRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxforwardmeetingrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxForwardMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxForwardMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxForwardMeetingRequestEventArgs := IEmailMailboxForwardMeetingRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxForwardMeetingRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
