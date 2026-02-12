#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Returned during Isolated Windows Environment creation, it represents the state of the creation process.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentprogressstate
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentProgressState extends Win32Enum{

    /**
     * Isolated Windows Environment creation is queued.
     * @type {Integer (Int32)}
     */
    static Queued => 0

    /**
     * Isolated Windows Environment creation is preparing to start.
     * @type {Integer (Int32)}
     */
    static Processing => 1

    /**
     * Isolated Windows Environment creation has completed.
     * @type {Integer (Int32)}
     */
    static Completed => 2

    /**
     * Isolated Windows Environment creation is in progress.
     * @type {Integer (Int32)}
     */
    static Creating => 3

    /**
     * Something went wrong while creating the Isolated Windows Environment. The creation is being retried.
     * @type {Integer (Int32)}
     */
    static Retrying => 4

    /**
     * Isolated Windows Environment is starting.
     * @type {Integer (Int32)}
     */
    static Starting => 5

    /**
     * Isolated Windows Environment settings are being configured.
     * @type {Integer (Int32)}
     */
    static Finalizing => 6
}
