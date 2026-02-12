#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the state of an audio effect.
 * @remarks
 * This enumeration is used in calls to [SetState](/uwp/api/windows.media.effects.audioeffect.setstate).
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectstate
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class AudioEffectState extends Win32Enum{

    /**
     * The audio effect is disabled.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * The audio effect is enabled.
     * @type {Integer (Int32)}
     */
    static On => 1
}
