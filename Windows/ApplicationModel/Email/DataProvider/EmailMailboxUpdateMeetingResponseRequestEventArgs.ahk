#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxUpdateMeetingResponseRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to update a meeting response.
 * @remarks
 * Use the instance of this class that's passed as an argument to your [UpdateMeetingResponseRequested](emaildataproviderconnection_updatemeetingresponserequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequesteventargs
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxUpdateMeetingResponseRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxUpdateMeetingResponseRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxUpdateMeetingResponseRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailMailboxUpdateMeetingResponseRequest](emailmailboxupdatemeetingresponserequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequesteventargs.request
     * @type {EmailMailboxUpdateMeetingResponseRequest} 
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
     * @returns {EmailMailboxUpdateMeetingResponseRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequestEventArgs := IEmailMailboxUpdateMeetingResponseRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxupdatemeetingresponserequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxUpdateMeetingResponseRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxUpdateMeetingResponseRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxUpdateMeetingResponseRequestEventArgs := IEmailMailboxUpdateMeetingResponseRequestEventArgs(outPtr)
        }

        return this.__IEmailMailboxUpdateMeetingResponseRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
