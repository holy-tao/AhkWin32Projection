#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of content in appointment details.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentdetailskind
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentDetailsKind extends Win32Enum{

    /**
     * Content is in plain text.
     * @type {Integer (Int32)}
     */
    static PlainText => 0

    /**
     * Content is in HTML markup.
     * @type {Integer (Int32)}
     */
    static Html => 1
}
