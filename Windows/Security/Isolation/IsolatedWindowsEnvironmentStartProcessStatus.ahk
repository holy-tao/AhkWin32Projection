#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Results of start process in the Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentstartprocessstatus
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentStartProcessStatus extends Win32Enum{

    /**
     * Start process in the Isolated Windows Environment succeed.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Start process in the Isolated Windows Environment failed with unknown error.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * Start process in the Isolated Windows Environment failed because the Environment is not available.
     * @type {Integer (Int32)}
     */
    static EnvironmentUnavailable => 2

    /**
     * Start process in the Isolated Windows Environment failed because a file was not found.
     * @type {Integer (Int32)}
     */
    static FileNotFound => 3

    /**
     * Start process in the Isolated Windows Environment failed because the application is not registered.
     * @type {Integer (Int32)}
     */
    static AppNotRegistered => 4
}
