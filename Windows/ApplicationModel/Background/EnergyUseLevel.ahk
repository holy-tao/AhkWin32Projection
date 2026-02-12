#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the energy consumption level of a background task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.energyuselevel
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class EnergyUseLevel extends Win32Enum{

    /**
     * The energy consumption level of the background task is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The energy consumption level of the background task is under half of the budget.
     * @type {Integer (Int32)}
     */
    static UnderHalfOfBudget => 1

    /**
     * The energy consumption level of the background task is over half of the budget.
     * @type {Integer (Int32)}
     */
    static OverHalfOfBudget => 2

    /**
     * The energy consumption level of the background task is over the budget.
     * @type {Integer (Int32)}
     */
    static OverBudget => 3
}
