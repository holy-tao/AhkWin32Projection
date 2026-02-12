#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarUpdateMeetingResponseRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for an [UpdateMeetingResponseRequested](appointmentdataproviderconnection_updatemeetingresponserequested.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [UpdateMeetingResponseRequested](appointmentdataproviderconnection_updatemeetingresponserequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequesteventargs
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarUpdateMeetingResponseRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarUpdateMeetingResponseRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarUpdateMeetingResponseRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [AppointmentCalendarUpdateMeetingResponseRequest](appointmentcalendarupdatemeetingresponserequest.md) object for the corresponding [UpdateMeetingResponseRequested](appointmentdataproviderconnection_updatemeetingresponserequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequesteventargs.request
     * @type {AppointmentCalendarUpdateMeetingResponseRequest} 
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
     * @returns {AppointmentCalendarUpdateMeetingResponseRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequestEventArgs := IAppointmentCalendarUpdateMeetingResponseRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequestEventArgs.get_Request()
    }

    /**
     * Gets the deferral object for the [UpdateMeetingResponseRequested](appointmentdataproviderconnection_updatemeetingresponserequested.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarupdatemeetingresponserequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAppointmentCalendarUpdateMeetingResponseRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarUpdateMeetingResponseRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarUpdateMeetingResponseRequestEventArgs := IAppointmentCalendarUpdateMeetingResponseRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarUpdateMeetingResponseRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
