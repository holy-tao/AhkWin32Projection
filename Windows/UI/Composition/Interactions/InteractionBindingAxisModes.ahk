#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify which axis is bound between two interaction trackers.
 * @remarks
 * Pass **None** to [InteractionTracker.SetBindingMode](interactiontracker_setbindingmode_301005309.md) to remove an existing binding mode.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactionbindingaxismodes
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionBindingAxisModes extends Win32BitflagEnum{

    /**
     * The binding does not affect any axis.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The binding affects the X axis.
     * @type {Integer (UInt32)}
     */
    static PositionX => 1

    /**
     * The binding affects the Y axis.
     * @type {Integer (UInt32)}
     */
    static PositionY => 2

    /**
     * The binding affects scale.
     * @type {Integer (UInt32)}
     */
    static Scale => 4
}
