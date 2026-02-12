#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of response to a meeting request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmeetingresponsetype
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMeetingResponseType extends Win32Enum{

    /**
     * The meeting was accepted.
     * @type {Integer (Int32)}
     */
    static Accept => 0

    /**
     * The meeting was declined.
     * @type {Integer (Int32)}
     */
    static Decline => 1

    /**
     * The meeting was tentatively accepted.
     * @type {Integer (Int32)}
     */
    static Tentative => 2
}
