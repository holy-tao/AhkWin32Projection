#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes an application's access to a single capability.
 * @remarks
 * "Requesting" access means to ask the system to do a full access check, which may involve a user prompt. Requests will never return "UserPromptRequired". "Checking" access will simply query your status and is guaranteed to not prompt, as such may return the status "UserPromptRequired".
 * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapabilityaccessstatus
 * @namespace Windows.Security.Authorization.AppCapabilityAccess
 * @version WindowsRuntime 1.4
 */
class AppCapabilityAccessStatus extends Win32Enum{

    /**
     * State: Denied by System.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 0

    /**
     * State: Not Declared by App.
     * @type {Integer (Int32)}
     */
    static NotDeclaredByApp => 1

    /**
     * State: Denied by User.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 2

    /**
     * State: User Prompt Required
     * @type {Integer (Int32)}
     */
    static UserPromptRequired => 3

    /**
     * State: Allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 4
}
