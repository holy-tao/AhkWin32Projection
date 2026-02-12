#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of change represented by an [AppointmentStoreChange](appointmentstorechange.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangetype
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentStoreChangeType extends Win32Enum{

    /**
     * An appointment was created.
     * @type {Integer (Int32)}
     */
    static AppointmentCreated => 0

    /**
     * An appointment was modified.
     * @type {Integer (Int32)}
     */
    static AppointmentModified => 1

    /**
     * An appointment was deleted.
     * @type {Integer (Int32)}
     */
    static AppointmentDeleted => 2

    /**
     * The change tracking information associated with the appointment was lost.
     * @type {Integer (Int32)}
     */
    static ChangeTrackingLost => 3

    /**
     * A calendar was created.
     * @type {Integer (Int32)}
     */
    static CalendarCreated => 4

    /**
     * A calendar was modified.
     * @type {Integer (Int32)}
     */
    static CalendarModified => 5

    /**
     * A calendar was deleted.
     * @type {Integer (Int32)}
     */
    static CalendarDeleted => 6
}
