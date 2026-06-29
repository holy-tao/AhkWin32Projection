#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the state of an audio effect.
 * @remarks
 * Get the state of an audio effect by calling [IAudioEffectsManager::GetAudioEffects](nf-audioclient-iaudioeffectsmanager-getaudioeffects.md) and checking the *state* field of the returned [AUDIO_EFFECT](ns-audioclient-audio_effect.md) structures.
 * 
 * Set the state of an audio effect by calling [IAudioEffectsManager::SetAudioEffectState](nf-audioclient-iaudioeffectsmanager-setaudioeffectstate.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ne-audioclient-audio_effect_state
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AUDIO_EFFECT_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
