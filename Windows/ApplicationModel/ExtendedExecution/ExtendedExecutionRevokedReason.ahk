#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the reason background execution was revoked.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionrevokedreason
 * @namespace Windows.ApplicationModel.ExtendedExecution
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionRevokedReason extends Win32Enum{

    /**
     * The app was resumed while it was executing in the background.
     * @type {Integer (Int32)}
     */
    static Resumed => 0

    /**
     * Background execution is revoked due to system resources.
     * @type {Integer (Int32)}
     */
    static SystemPolicy => 1
}
