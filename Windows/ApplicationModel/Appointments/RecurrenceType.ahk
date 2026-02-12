#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the recurrence type of an appointment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.recurrencetype
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class RecurrenceType extends Win32Enum{

    /**
     * The appointment is the master appointment for a recurring appointment.
     * @type {Integer (Int32)}
     */
    static Master => 0

    /**
     * The appointment is an instance of a recurring appointment.
     * @type {Integer (Int32)}
     */
    static Instance => 1

    /**
     * The appointment is an exceptional instance of a recurring appointment.
     * @type {Integer (Int32)}
     */
    static ExceptionInstance => 2
}
