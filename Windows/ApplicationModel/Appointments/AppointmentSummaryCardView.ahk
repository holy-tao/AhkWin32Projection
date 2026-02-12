#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how the summary card for an appointment is displayed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsummarycardview
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentSummaryCardView extends Win32Enum{

    /**
     * The appointment summary card is displayed by the system.
     * @type {Integer (Int32)}
     */
    static System => 0

    /**
     * The appointment summary card is displayed by the app that owns the appointment calendar.
     * @type {Integer (Int32)}
     */
    static App => 1
}
