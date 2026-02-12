#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes the execution state of the resource group.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupexecutionstate
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupExecutionState extends Win32Enum{

    /**
     * The execution state is not known.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The resource group is part of an app that is currently running.
     * @type {Integer (Int32)}
     */
    static Running => 1

    /**
     * The resource group is part of an app that is entering the suspend state.
     * @type {Integer (Int32)}
     */
    static Suspending => 2

    /**
     * The resource group is part of an app that has been suspended.
     * @type {Integer (Int32)}
     */
    static Suspended => 3

    /**
     * The resource group is part of an app that is not running.
     * @type {Integer (Int32)}
     */
    static NotRunning => 4
}
