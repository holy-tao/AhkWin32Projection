#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the context in which an app runs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appexecutioncontext
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class AppExecutionContext extends Win32Enum{

    /**
     * The app context is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The app runs in the host context.
     * @type {Integer (Int32)}
     */
    static Host => 1

    /**
     * The app runs in the guest context.
     * @type {Integer (Int32)}
     */
    static Guest => 2
}
