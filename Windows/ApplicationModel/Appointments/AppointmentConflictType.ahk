#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the way in which an appointment conflicts with another appointment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentconflicttype
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentConflictType extends Win32Enum{

    /**
     * There is no appointment conflict.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The appointment is adjacent to another appointment.
     * @type {Integer (Int32)}
     */
    static Adjacent => 1

    /**
     * The appointment overlaps another appointment.
     * @type {Integer (Int32)}
     */
    static Overlap => 2
}
