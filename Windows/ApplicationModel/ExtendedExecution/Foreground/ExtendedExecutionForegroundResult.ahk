#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the possible extended execution request result values.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundresult
 * @namespace Windows.ApplicationModel.ExtendedExecution.Foreground
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionForegroundResult extends Win32Enum{

    /**
     * Extended execution is allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 0

    /**
     * App execution is not allowed.
     * @type {Integer (Int32)}
     */
    static Denied => 1
}
