#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the state of an audio effect.
 * @remarks
 * Get the state of an audio effect by calling [IAudioEffectsManager::GetAudioEffects](nf-audioclient-iaudioeffectsmanager-getaudioeffects.md) and checking the *state* field of the returned [AUDIO_EFFECT](ns-audioclient-audio_effect.md) structures.
  * 
  * Set the state of an audio effect by calling [IAudioEffectsManager::SetAudioEffectState](nf-audioclient-iaudioeffectsmanager-setaudioeffectstate.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ne-audioclient-audio_effect_state
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIO_EFFECT_STATE{

    /**
     * The audio effect is off.
     * @type {Integer (Int32)}
     */
    static AUDIO_EFFECT_STATE_OFF => 0

    /**
     * The audio effect is on.
     * @type {Integer (Int32)}
     */
    static AUDIO_EFFECT_STATE_ON => 1
}
