#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the current sync status of an [AppointmentCalendar](appointmentcalendar.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendarsyncstatus
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarSyncStatus extends Win32Enum{

    /**
     * There is no sync operation currently occurring.
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * A sync operation is in progress.
     * @type {Integer (Int32)}
     */
    static Syncing => 1

    /**
     * The local machine and server are up to date.
     * @type {Integer (Int32)}
     */
    static UpToDate => 2

    /**
     * An authentication error occurred when trying to connect to the server.
     * @type {Integer (Int32)}
     */
    static AuthenticationError => 3

    /**
     * A policy error occurred.
     * @type {Integer (Int32)}
     */
    static PolicyError => 4

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static UnknownError => 5

    /**
     * The account must be manually removed.
     * @type {Integer (Int32)}
     */
    static ManualAccountRemovalRequired => 6
}
