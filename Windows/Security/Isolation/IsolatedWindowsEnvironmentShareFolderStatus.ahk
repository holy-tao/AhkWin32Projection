#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Enumeration of possible statuses indicating the result of a share folder request.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentsharefolderstatus
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentShareFolderStatus extends Win32Enum{

    /**
     * Succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Unknown failure.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * Isolated Windows Environment not available.
     * @type {Integer (Int32)}
     */
    static EnvironmentUnavailable => 2

    /**
     * Folder not found.
     * @type {Integer (Int32)}
     */
    static FolderNotFound => 3

    /**
     * Access denied.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 4
}
