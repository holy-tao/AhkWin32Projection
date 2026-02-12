#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Enum values for the status of file launch into Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentlaunchfilestatus
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentLaunchFileStatus extends Win32Enum{

    /**
     * File launch into an Isolated Windows Environment succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * File launch into an Isolated Windows Environment has an unknown failure.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * File launch into an Isolated Windows Environment failed because the environment isn't available.
     * @type {Integer (Int32)}
     */
    static EnvironmentUnavailable => 2

    /**
     * File launch into an Isolated Windows Environment failed because the file was not found.
     * @type {Integer (Int32)}
     */
    static FileNotFound => 3

    /**
     * File launch into an Isolated Windows Environment timed out.
     * @type {Integer (Int32)}
     */
    static TimedOut => 4

    /**
     * File was previously shared with invalid/conflicting options. For example, if a file is shared previously with the [ShareFileAsync](isolatedwindowsenvironment_sharefileasync_1722827044.md) call and AllowWrite in [IsolatedWindowsEnvironmentShareFileRequestOptions](isolatedwindowsenvironmentsharefilerequestoptions.md) is false, this error will be thrown.
     * @type {Integer (Int32)}
     */
    static AlreadySharedWithConflictingOptions => 5
}
