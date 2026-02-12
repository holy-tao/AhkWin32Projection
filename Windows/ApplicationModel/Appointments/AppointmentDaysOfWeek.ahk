#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the days of the week on which an appointment occurs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentdaysofweek
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentDaysOfWeek extends Win32BitflagEnum{

    /**
     * The appointment doesn't occur on any days of the week.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The appointment occurs on Sunday.
     * @type {Integer (UInt32)}
     */
    static Sunday => 1

    /**
     * The appointment occurs on Monday.
     * @type {Integer (UInt32)}
     */
    static Monday => 2

    /**
     * The appointment occurs on Tuesday.
     * @type {Integer (UInt32)}
     */
    static Tuesday => 4

    /**
     * The appointment occurs on Wednesday.
     * @type {Integer (UInt32)}
     */
    static Wednesday => 8

    /**
     * The appointment occurs on Thursday.
     * @type {Integer (UInt32)}
     */
    static Thursday => 16

    /**
     * The appointment occurs on Friday.
     * @type {Integer (UInt32)}
     */
    static Friday => 32

    /**
     * The appointment occurs on Saturday.
     * @type {Integer (UInt32)}
     */
    static Saturday => 64
}
