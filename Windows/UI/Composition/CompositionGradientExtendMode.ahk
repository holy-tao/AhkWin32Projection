#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how to draw the gradient outside the brush's gradient vector or space.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientextendmode
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionGradientExtendMode extends Win32Enum{

    /**
     * The gradient is not extended.
     * @type {Integer (Int32)}
     */
    static Clamp => 0

    /**
     * The gradient is wrapped.
     * @type {Integer (Int32)}
     */
    static Wrap => 1

    /**
     * The gradient is repeated in the reverse direction..
     * @type {Integer (Int32)}
     */
    static Mirror => 2
}
