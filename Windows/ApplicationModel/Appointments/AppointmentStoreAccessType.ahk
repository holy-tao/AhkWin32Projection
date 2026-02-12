#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the level of access granted to an [AppointmentStore](appointmentstore.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstoreaccesstype
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentStoreAccessType extends Win32Enum{

    /**
     * The appointment store has read and write access to appointment calendars created by the calling app.
     * @type {Integer (Int32)}
     */
    static AppCalendarsReadWrite => 0

    /**
     * The appointment store has read-only access to all calendars on the device.
     * @type {Integer (Int32)}
     */
    static AllCalendarsReadOnly => 1

    /**
     * The appointment store has read and write access to all calendars created by the calling app.
     * @type {Integer (Int32)}
     */
    static AllCalendarsReadWrite => 2
}
