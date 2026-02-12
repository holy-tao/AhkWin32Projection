#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the behavior of an animation when it stops.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationstopbehavior
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class AnimationStopBehavior extends Win32Enum{

    /**
     * Leave the animation at its current value.
     * @type {Integer (Int32)}
     */
    static LeaveCurrentValue => 0

    /**
     * Reset the animation to its initial value.
     * @type {Integer (Int32)}
     */
    static SetToInitialValue => 1

    /**
     * Set the animation to its final value.
     * @type {Integer (Int32)}
     */
    static SetToFinalValue => 2
}
