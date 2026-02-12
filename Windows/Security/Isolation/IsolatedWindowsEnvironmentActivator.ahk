#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Controls whether folder sharing or create process executes as system or user.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentactivator
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentActivator extends Win32Enum{

    /**
     * Executing as System
     * @type {Integer (Int32)}
     */
    static System => 0

    /**
     * Executing as User
     * @type {Integer (Int32)}
     */
    static User => 1
}
