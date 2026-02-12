#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Determines what kind of content is allowed to be copied and pasted to/from an Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentallowedclipboardformats
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentAllowedClipboardFormats extends Win32BitflagEnum{

    /**
     * Does not allow any content.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Allow text content.
     * @type {Integer (UInt32)}
     */
    static Text => 1

    /**
     * Allow image content.
     * @type {Integer (UInt32)}
     */
    static Image => 2

    /**
     * Allow rich text format (RTF) content.
     * @type {Integer (UInt32)}
     */
    static Rtf => 4
}
