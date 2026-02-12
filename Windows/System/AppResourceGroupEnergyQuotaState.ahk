#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes how the resource group is performing relative to its energy quota.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupenergyquotastate
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupEnergyQuotaState extends Win32Enum{

    /**
     * Unable to determine the energy quota state.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The resource group has used more than its energy quota.
     * @type {Integer (Int32)}
     */
    static Over => 1

    /**
     * The resource group has not used its energy quota.
     * @type {Integer (Int32)}
     */
    static Under => 2
}
