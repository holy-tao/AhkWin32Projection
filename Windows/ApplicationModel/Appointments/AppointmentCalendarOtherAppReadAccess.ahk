#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the level of read access provided to an app calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendarotherappreadaccess
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarOtherAppReadAccess extends Win32Enum{

    /**
     * Only the operating system can read data from the app calendar.
     * @type {Integer (Int32)}
     */
    static SystemOnly => 0

    /**
     * Other apps on the device can read the [Subject](appointment_subject.md), [StartTime](appointment_starttime.md), [Duration](appointment_duration.md), [AllDay](appointment_allday.md), [LocalId](appointment_localid.md) properties of appointments in the calendar and the [LocalId](appointmentcalendar_localid.md) property of the calendar
     * @type {Integer (Int32)}
     */
    static Limited => 1

    /**
     * Other apps on the device can read all properties of appointments in the calendar.
     * @type {Integer (Int32)}
     */
    static Full => 2

    /**
     * Other apps on the device cannot read any properties of appointments in the calendar.
     * @type {Integer (Int32)}
     */
    static None => 3
}
