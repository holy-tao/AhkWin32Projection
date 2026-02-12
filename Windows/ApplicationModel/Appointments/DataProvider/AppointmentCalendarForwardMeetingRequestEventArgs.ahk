#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarForwardMeetingRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for a [ForwardMeetingRequested](appointmentdataproviderconnection_forwardmeetingrequested.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [ForwardMeetingRequested](appointmentdataproviderconnection_forwardmeetingrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequesteventargs
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarForwardMeetingRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarForwardMeetingRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarForwardMeetingRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [AppointmentCalendarForwardMeetingRequest](appointmentcalendarforwardmeetingrequest.md) object for the corresponding [ForwardMeetingRequested](appointmentdataproviderconnection_forwardmeetingrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequesteventargs.request
     * @type {AppointmentCalendarForwardMeetingRequest} 
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
     * @returns {AppointmentCalendarForwardMeetingRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequestEventArgs := IAppointmentCalendarForwardMeetingRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequestEventArgs.get_Request()
    }

    /**
     * Gets the deferral object for the [ForwardMeetingRequested](appointmentdataproviderconnection_forwardmeetingrequested.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarforwardmeetingrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAppointmentCalendarForwardMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarForwardMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarForwardMeetingRequestEventArgs := IAppointmentCalendarForwardMeetingRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarForwardMeetingRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
