#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible background execution request result values.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionresult
 * @namespace Windows.ApplicationModel.ExtendedExecution
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionResult extends Win32Enum{

    /**
     * App execution is allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 0

    /**
     * App execution is denied.
     * @type {Integer (Int32)}
     */
    static Denied => 1
}
