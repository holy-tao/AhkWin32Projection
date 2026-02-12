#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Contains the actual returns of Isolated Windows Environment creation status.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentcreatestatus
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentCreateStatus extends Win32Enum{

    /**
     * Isolated Windows Environment creation succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Isolated Windows Environment creation failed due to policy configuration.
     * @type {Integer (Int32)}
     */
    static FailureByPolicy => 1

    /**
     * Isolated Windows Environment creation failed with an unknown failure.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 2
}
