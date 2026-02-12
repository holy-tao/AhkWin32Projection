#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the result status of the full trust process launch operation.
 * @remarks
 * Values from this enumeration are used by the [FullTrustProcessLaunchResult](fulltrustprocesslaunchresult.md) object, which is obtained through calls to the following methods.
 * 
 * - [LaunchFullTrustProcessForAppWithArgumentsAsync](fulltrustprocesslauncher_launchfulltrustprocessforappwithargumentsasync_783196823.md)
 * - [LaunchFullTrustProcessForCurrentAppWithArgumentsAsync](fulltrustprocesslauncher_launchfulltrustprocessforcurrentappwithargumentsasync_1868807952.md)
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustlaunchresult
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class FullTrustLaunchResult extends Win32Enum{

    /**
     * The operation was successful
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The calling app does not have permission to execute the operation.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 1

    /**
     * The file associated with the operation was not found.
     * @type {Integer (Int32)}
     */
    static FileNotFound => 2

    /**
     * The operation failed for unknown reasons.
     * @type {Integer (Int32)}
     */
    static Unknown => 3
}
