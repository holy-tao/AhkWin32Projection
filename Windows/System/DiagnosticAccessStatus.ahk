#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Indicates if your app has permission to access to UWP app diagnostic information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnosticaccessstatus
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class DiagnosticAccessStatus extends Win32Enum{

    /**
     * Diagnostic access is unspecified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Diagnostic access is denied for all app packages.
     * @type {Integer (Int32)}
     */
    static Denied => 1

    /**
     * Diagnostic access is allowed for this app package only.
     * @type {Integer (Int32)}
     */
    static Limited => 2

    /**
     * Diagnostic access is allowed for all app packages.
     * @type {Integer (Int32)}
     */
    static Allowed => 3
}
