#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Contains the actual returns of post message from host to Isolated Windows Environment status.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentpostmessagestatus
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentPostMessageStatus extends Win32Enum{

    /**
     * Post message from host to Isolated Windows Environment succeeded
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Post message from host to Isolated Windows Environment failed with an unknown failure
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * Post message from host to Isolated Windows Environment failed due to environment unavailable
     * @type {Integer (Int32)}
     */
    static EnvironmentUnavailable => 2
}
