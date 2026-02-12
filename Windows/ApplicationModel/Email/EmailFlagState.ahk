#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the flag state of an email message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailflagstate
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailFlagState extends Win32Enum{

    /**
     * The email has not been flagged for follow up.
     * @type {Integer (Int32)}
     */
    static Unflagged => 0

    /**
     * The email has been flagged for follow up.
     * @type {Integer (Int32)}
     */
    static Flagged => 1

    /**
     * The email was flagged for follow up and has been marked completed.
     * @type {Integer (Int32)}
     */
    static Completed => 2

    /**
     * The email was flagged for follow up and the flag has been cleared.
     * @type {Integer (Int32)}
     */
    static Cleared => 3
}
