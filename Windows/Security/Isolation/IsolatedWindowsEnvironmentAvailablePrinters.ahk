#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Determines which printers are accessible from within the Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentavailableprinters
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentAvailablePrinters extends Win32BitflagEnum{

    /**
     * Does not allow any printers in the container
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Allow local printer
     * @type {Integer (UInt32)}
     */
    static Local => 1

    /**
     * Allow network printer
     * @type {Integer (UInt32)}
     */
    static Network => 2

    /**
     * Allow print to PDF
     * @type {Integer (UInt32)}
     */
    static SystemPrintToPdf => 4

    /**
     * Allow print to XPS
     * @type {Integer (UInt32)}
     */
    static SystemPrintToXps => 8
}
