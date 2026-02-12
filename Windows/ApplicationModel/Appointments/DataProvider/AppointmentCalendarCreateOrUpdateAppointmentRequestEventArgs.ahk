#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for a [CreateOrUpdateAppointmentRequested](appointmentdataproviderconnection_createorupdateappointmentrequested.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [CreateOrUpdateAppointmentRequested](appointmentdataproviderconnection_createorupdateappointmentrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequesteventargs
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [AppointmentCalendarCreateOrUpdateAppointmentRequest](appointmentcalendarcreateorupdateappointmentrequest.md) object for the corresponding [CreateOrUpdateAppointmentRequested](appointmentdataproviderconnection_createorupdateappointmentrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequesteventargs.request
     * @type {AppointmentCalendarCreateOrUpdateAppointmentRequest} 
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
     * @returns {AppointmentCalendarCreateOrUpdateAppointmentRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs := IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs.get_Request()
    }

    /**
     * Gets the deferral object for the [CreateOrUpdateAppointmentRequested](appointmentdataproviderconnection_createorupdateappointmentrequested.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.dataprovider.appointmentcalendarcreateorupdateappointmentrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs := IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs(outPtr)
        }

        return this.__IAppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
