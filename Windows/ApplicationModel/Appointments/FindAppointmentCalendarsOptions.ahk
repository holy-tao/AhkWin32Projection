#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies additional options when querying for appointment calendars.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.findappointmentcalendarsoptions
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class FindAppointmentCalendarsOptions extends Win32BitflagEnum{

    /**
     * No additional options.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Include appointment calendars that are hidden.
     * @type {Integer (UInt32)}
     */
    static IncludeHidden => 1
}
