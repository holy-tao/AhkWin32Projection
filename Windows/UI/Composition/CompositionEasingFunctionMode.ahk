#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the animation associated with an easing function interpolates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioneasingfunctionmode
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionEasingFunctionMode extends Win32Enum{

    /**
     * Interpolation follows the mathematical formula associated with the easing function.
     * @type {Integer (Int32)}
     */
    static In => 0

    /**
     * Interpolation follows 100% interpolation minus the output of the formula associated with the easing function.
     * @type {Integer (Int32)}
     */
    static Out => 1

    /**
     * Interpolation uses `In` for the first half of the animation and `Out` for the second half.
     * @type {Integer (Int32)}
     */
    static InOut => 2
}
