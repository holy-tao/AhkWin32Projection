#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of the force feedback effect.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.conditionforceeffectkind
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class ConditionForceEffectKind extends Win32Enum{

    /**
     * The force increases in proportion to the distance of the axis from a defined neutral point.
     * @type {Integer (Int32)}
     */
    static Spring => 0

    /**
     * The force increases in proportion to the velocity with which the user moves the axis.
     * @type {Integer (Int32)}
     */
    static Damper => 1

    /**
     * The force increases in proportion to the acceleration of the axis.
     * @type {Integer (Int32)}
     */
    static Inertia => 2

    /**
     * The force is applied when the axis is moved and depends on the defined friction coefficient.
     * @type {Integer (Int32)}
     */
    static Friction => 3
}
