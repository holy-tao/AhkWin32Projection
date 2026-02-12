#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the frequency for which an appointment occurs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentrecurrenceunit
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentRecurrenceUnit extends Win32Enum{

    /**
     * Appointment occurs daily.
     * @type {Integer (Int32)}
     */
    static Daily => 0

    /**
     * Appointment occurs weekly.
     * @type {Integer (Int32)}
     */
    static Weekly => 1

    /**
     * Appointment occurs monthly.
     * @type {Integer (Int32)}
     */
    static Monthly => 2

    /**
     * Appointment occurs monthly on a particular day of the month.
     * @type {Integer (Int32)}
     */
    static MonthlyOnDay => 3

    /**
     * Appointment occurs yearly.
     * @type {Integer (Int32)}
     */
    static Yearly => 4

    /**
     * Appointment occurs yearly on a particular day of the year.
     * @type {Integer (Int32)}
     */
    static YearlyOnDay => 5
}
