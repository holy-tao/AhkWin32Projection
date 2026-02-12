#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The current state of a force feedback effect.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackeffectstate
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class ForceFeedbackEffectState extends Win32Enum{

    /**
     * The effect is stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * The effect is running.
     * @type {Integer (Int32)}
     */
    static Running => 1

    /**
     * The effect is paused.
     * @type {Integer (Int32)}
     */
    static Paused => 2

    /**
     * The effect has faulted.
     * @type {Integer (Int32)}
     */
    static Faulted => 3
}
