#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the busy status for a participant of an appointment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentbusystatus
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentBusyStatus extends Win32Enum{

    /**
     * The participant is busy and so can't attend the appointment.
     * @type {Integer (Int32)}
     */
    static Busy => 0

    /**
     * The participant might be able to attend the appointment.
     * @type {Integer (Int32)}
     */
    static Tentative => 1

    /**
     * The participant is free and so can attend the appointment.
     * @type {Integer (Int32)}
     */
    static Free => 2

    /**
     * The participant is out of office.
     * @type {Integer (Int32)}
     */
    static OutOfOffice => 3

    /**
     * The participant is working elsewhere.
     * @type {Integer (Int32)}
     */
    static WorkingElsewhere => 4
}
