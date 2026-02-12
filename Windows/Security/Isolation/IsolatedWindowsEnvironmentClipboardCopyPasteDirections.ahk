#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Determines the direction in which copy pasting of content is allowed: host to Isolated Windows Environment or Isolated Windows Enviornment to host.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentclipboardcopypastedirections
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentClipboardCopyPasteDirections extends Win32BitflagEnum{

    /**
     * Does not allow copy or paste.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Allow copy and paste from the host to the Isolated Windows Environment.
     * @type {Integer (UInt32)}
     */
    static HostToIsolatedWindowsEnvironment => 1

    /**
     * Allow copy and paste from the Isolated Windows Environment to the host.
     * @type {Integer (UInt32)}
     */
    static IsolatedWindowsEnvironmentToHost => 2
}
