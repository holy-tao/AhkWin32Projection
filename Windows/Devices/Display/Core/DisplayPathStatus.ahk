#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the last status of the path in the system, captured when the [DisplayState](displaystate.md) was last created or applied.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypathstatus
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayPathStatus extends Win32Enum{

    /**
     * Used for newly created paths that have not been applied.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Indicates that the path has been successfully applied, and was currently active when the [DisplayState](displaystate.md) was last created or applied.
     * @type {Integer (Int32)}
     */
    static Succeeded => 1

    /**
     * Indicates that the last apply operation was completed successfully, but the driver has indicated that it is still applying the path to the hardware asynchronously.
     * @type {Integer (Int32)}
     */
    static Pending => 2

    /**
     * Indicates that a path failed synchronously during a [TryApply](displaystate_tryapply_634222246.md) or [TryFunctionalize](displaystate_tryfunctionalize_741039460.md) call.
     * @type {Integer (Int32)}
     */
    static Failed => 3

    /**
     * Indicates that the display hardware has asynchronously failed the path, either due to changing bandwidth allocations, or due to driver errors during another mode change. This path should be re-evaluated and re-applied by the owner.
     * @type {Integer (Int32)}
     */
    static FailedAsync => 4

    /**
     * Indicates that the path is likely still valid in hardware, but requires applying a mode again in order to reset pending software state. A path in this state typically shows a black screen on the output.
     * @type {Integer (Int32)}
     */
    static InvalidatedAsync => 5
}
