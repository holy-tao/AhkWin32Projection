#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the response from a participant concerning an appointment invitation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentparticipantresponse
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentParticipantResponse extends Win32Enum{

    /**
     * No response.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The participant might attend the appointment.
     * @type {Integer (Int32)}
     */
    static Tentative => 1

    /**
     * The participant accepted the appointment invitation.
     * @type {Integer (Int32)}
     */
    static Accepted => 2

    /**
     * The participant declined the appointment invitation.
     * @type {Integer (Int32)}
     */
    static Declined => 3

    /**
     * The response is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 4
}
