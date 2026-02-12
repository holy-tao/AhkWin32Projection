#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Used with the [NetworkUsageStates](networkusagestates.md) structure to define the desired roaming state and shared state of a network connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.tristates
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class TriStates extends Win32Enum{

    /**
     * Used when the corresponding state should not be used as a filter, for example, both yes and no.
     * @type {Integer (Int32)}
     */
    static DoNotCare => 0

    /**
     * The corresponding state is not set.
     * @type {Integer (Int32)}
     */
    static No => 1

    /**
     * The corresponding state is set.
     * @type {Integer (Int32)}
     */
    static Yes => 2
}
