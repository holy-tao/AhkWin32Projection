#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the role of an item concerning an appointment invitation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentparticipantrole
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentParticipantRole extends Win32Enum{

    /**
     * The participant's attendance at the appointment is required.
     * @type {Integer (Int32)}
     */
    static RequiredAttendee => 0

    /**
     * The participant's attendance at the appointment is optional.
     * @type {Integer (Int32)}
     */
    static OptionalAttendee => 1

    /**
     * The item is a resource that is needed at the appointment.
     * @type {Integer (Int32)}
     */
    static Resource => 2
}
