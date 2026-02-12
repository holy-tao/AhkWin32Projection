#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Behavior when an effect completes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectcompletionbehavior
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayEffectCompletionBehavior extends Win32Enum{

    /**
     * Clears the state of all lamps when effect completes for the start of the next effect in the playlist. This is the typical case for most effects.
     * @type {Integer (Int32)}
     */
    static ClearState => 0

    /**
     * Maintains the state of all lamps when effect completes, so state is preserved for start of the next effect in the playlist. Use to seamlessly connect effects when the end state is known.
     * @type {Integer (Int32)}
     */
    static KeepState => 1
}
