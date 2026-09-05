#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of an audio effect.
 * @remarks
 * Get the state of an audio effect by calling [IAudioEffectsManager::GetAudioEffects](nf-audioclient-iaudioeffectsmanager-getaudioeffects.md) and checking the *state* field of the returned [AUDIO_EFFECT](ns-audioclient-audio_effect.md) structures.
 * 
 * Set the state of an audio effect by calling [IAudioEffectsManager::SetAudioEffectState](nf-audioclient-iaudioeffectsmanager-setaudioeffectstate.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ne-audioclient-audio_effect_state
 * @namespace Windows.Win32.Media.Audio
 */
class AUDIO_EFFECT_STATE extends Win32Enum {

    /**
     * The audio effect is off.
     * Native name: AUDIO_EFFECT_STATE_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * The audio effect is on.
     * Native name: AUDIO_EFFECT_STATE_ON
     * @type {Integer (Int32)}
     */
    static ON => 1
}
