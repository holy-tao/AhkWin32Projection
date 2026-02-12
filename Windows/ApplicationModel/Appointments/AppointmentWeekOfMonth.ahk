#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the week of the month for which the appointment occurs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentweekofmonth
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentWeekOfMonth extends Win32Enum{

    /**
     * The appointment occurs on the first week of the month.
     * @type {Integer (Int32)}
     */
    static First => 0

    /**
     * The appointment occurs on the second week of the month.
     * @type {Integer (Int32)}
     */
    static Second => 1

    /**
     * The appointment occurs on the third week of the month.
     * @type {Integer (Int32)}
     */
    static Third => 2

    /**
     * The appointment occurs on the fourth week of the month.
     * @type {Integer (Int32)}
     */
    static Fourth => 3

    /**
     * The appointment occurs on the last week of the month.
     * @type {Integer (Int32)}
     */
    static Last => 4
}
