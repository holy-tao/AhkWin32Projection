#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Current state of process execution in the Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentprocessstate
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentProcessState extends Win32Enum{

    /**
     * Process in Isolated Windows Environment is running.
     * @type {Integer (Int32)}
     */
    static Running => 1

    /**
     * Process in Isolated Windows Environment has been aborted.
     * @type {Integer (Int32)}
     */
    static Aborted => 2

    /**
     * Process in Isolated Windows Environment has completed.
     * @type {Integer (Int32)}
     */
    static Completed => 3
}
