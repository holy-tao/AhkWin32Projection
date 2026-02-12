#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Represents the priority of an isolated environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentcreationpriority
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentCreationPriority extends Win32Enum{

    /**
     * Low priority.
     * @type {Integer (Int32)}
     */
    static Low => 0

    /**
     * Normal priority.
     * @type {Integer (Int32)}
     */
    static Normal => 1
}
