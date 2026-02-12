#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the level of write access provided to an app calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentcalendarotherappwriteaccess
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentCalendarOtherAppWriteAccess extends Win32Enum{

    /**
     * Only the app that created the calendar can write to it.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The operating system can write to the calendar.
     * @type {Integer (Int32)}
     */
    static SystemOnly => 1

    /**
     * Other apps on the device can perform any write-level actions that use a [DataProviderConnection](../windows.applicationmodel.appointments.dataprovider/appointmentdataproviderconnection.md).
     * @type {Integer (Int32)}
     */
    static Limited => 2
}
