#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the reason extended execution was revoked.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundrevokedreason
 * @namespace Windows.ApplicationModel.ExtendedExecution.Foreground
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionForegroundRevokedReason extends Win32Enum{

    /**
     * The app was resumed during its extended execution.
     * @type {Integer (Int32)}
     */
    static Resumed => 0

    /**
     * Extended execution is revoked due to system resources.
     * @type {Integer (Int32)}
     */
    static SystemPolicy => 1
}
