#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Enum values for the status of file share into Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentsharefilestatus
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentShareFileStatus extends Win32Enum{

    /**
     * File share into an Isolated Windows Environment succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * File share into an Isolated Windows Environment has an unknown failure.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * File share into an Isolated Windows Environment failed because the environment isn't available.
     * @type {Integer (Int32)}
     */
    static EnvironmentUnavailable => 2

    /**
     * File was previously shared with invalid/conflicting options. For example, if a file is launched previously with the [LaunchFileWithUIAsync](isolatedwindowsenvironment_launchfilewithuiasync_1697307470.md) call and AllowWrite in [IsolatedWindowsEnvironmentShareFileRequestOptions](isolatedwindowsenvironmentsharefilerequestoptions.md) is false, this error will be thrown.
     * @type {Integer (Int32)}
     */
    static AlreadySharedWithConflictingOptions => 3

    /**
     * File share into an Isolated Windows Environment failed because the file was not found.
     * @type {Integer (Int32)}
     */
    static FileNotFound => 4

    /**
     * File share into an Isolated Windows Environment failed because the user does not have access to the file.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 5
}
