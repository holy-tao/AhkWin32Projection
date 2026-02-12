#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarCancelMeetingRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for a [CancelMeetingRequested](appointmentdataproviderconnection_cancelmeetingrequested.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [CancelMeetingRequested](appointmentdataproviderconnection_cancelmeetingrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequesteventargs
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarCancelMeetingRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarCancelMeetingRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarCancelMeetingRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [AppointmentCalendarCancelMeetingRequest](appointmentcalendarcancelmeetingrequest.md) object for the corresponding [CancelMeetingRequested](appointmentdataproviderconnection_cancelmeetingrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequesteventargs.request
     * @type {AppointmentCalendarCancelMeetingRequest} 
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
     * @returns {AppointmentCalendarCancelMeetingRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequestEventArgs := IAppointmentCalendarCancelMeetingRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequestEventArgs.get_Request()
    }

    /**
     * Gets the deferral object for the [CancelMeetingRequested](appointmentdataproviderconnection_cancelmeetingrequested.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcancelmeetingrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAppointmentCalendarCancelMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCancelMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCancelMeetingRequestEventArgs := IAppointmentCalendarCancelMeetingRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarCancelMeetingRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
