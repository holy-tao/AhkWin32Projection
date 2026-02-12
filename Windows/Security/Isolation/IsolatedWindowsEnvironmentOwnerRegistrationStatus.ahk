#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Success or failure status of [isolatedwindowsenvironmentownerregistration](isolatedwindowsenvironmentownerregistration.md).
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistrationstatus
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentOwnerRegistrationStatus extends Win32Enum{

    /**
     * Owner registration for Isolated Windows Environment succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Owner registration for Isolated Windows Environment failed because of an invalid attribute.
     * @type {Integer (Int32)}
     */
    static InvalidArgument => 1

    /**
     * Owner registration for Isolated Windows Environment failed because access was denied.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 2

    /**
     * Owner registration for Isolated Windows Environment because of insufficient memory.
     * @type {Integer (Int32)}
     */
    static InsufficientMemory => 3

    /**
     * Owner registration for Isolated Windows Environment failed with unknown failure.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 4
}
