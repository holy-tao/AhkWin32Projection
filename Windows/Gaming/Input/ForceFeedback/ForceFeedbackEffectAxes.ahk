#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The axes the force feedback effect applies to.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackeffectaxes
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class ForceFeedbackEffectAxes extends Win32BitflagEnum{

    /**
     * The force feedback effect doesn't apply to any axes.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The force feedback effect applies to the x-axis.
     * @type {Integer (UInt32)}
     */
    static X => 1

    /**
     * The force feedback effect applies to the y-axis.
     * @type {Integer (UInt32)}
     */
    static Y => 2

    /**
     * The force feedback effect applies to the z-axis.
     * @type {Integer (UInt32)}
     */
    static Z => 4
}
