#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The results of an attempt to load a force feedback effect.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackloadeffectresult
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class ForceFeedbackLoadEffectResult extends Win32Enum{

    /**
     * The effect was successfully loaded.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The effect was not loaded because storage is full.
     * @type {Integer (Int32)}
     */
    static EffectStorageFull => 1

    /**
     * The effect is not supported.
     * @type {Integer (Int32)}
     */
    static EffectNotSupported => 2
}
