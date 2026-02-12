#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the sensitivity of an appointment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsensitivity
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentSensitivity extends Win32Enum{

    /**
     * The appointment is publicly available to view.
     * @type {Integer (Int32)}
     */
    static Public => 0

    /**
     * The appointment is private and can't be viewed publicly.
     * @type {Integer (Int32)}
     */
    static Private => 1
}
