#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for an [ProposeNewTimeForMeetingRequested](appointmentdataproviderconnection_proposenewtimeformeetingrequested.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [ProposeNewTimeForMeetingRequested](appointmentdataproviderconnection_proposenewtimeformeetingrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequesteventargs
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarProposeNewTimeForMeetingRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [AppointmentCalendarProposeNewTimeForMeetingRequest](appointmentcalendarproposenewtimeformeetingrequest.md) object for the corresponding [ProposeNewTimeForMeetingRequested](appointmentdataproviderconnection_proposenewtimeformeetingrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequesteventargs.request
     * @type {AppointmentCalendarProposeNewTimeForMeetingRequest} 
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
     * @returns {AppointmentCalendarProposeNewTimeForMeetingRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs := IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs.get_Request()
    }

    /**
     * Gets the deferral object for the [ProposeNewTimeForMeetingRequested](appointmentdataproviderconnection_proposenewtimeformeetingrequested.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarproposenewtimeformeetingrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs := IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarProposeNewTimeForMeetingRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
