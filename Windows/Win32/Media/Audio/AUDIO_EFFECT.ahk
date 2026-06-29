#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AUDIO_EFFECT_STATE.ahk" { AUDIO_EFFECT_STATE }

/**
 * Represents an audio effect.
 * @remarks
 * Get a list of **AUDIO_EFFECT** structures by calling [IAudioEffectsManager::GetAudioEffects](nf-audioclient-iaudioeffectsmanager-getaudioeffects.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audio_effect
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AUDIO_EFFECT {
    #StructPack 4

    /**
     * The GUID identifier for an audio effect. Audio effect GUIDs are defined in [ksmedia.h](/windows-hardware/drivers/audio/ksmedia-h).
     */
    id : Guid

    /**
     * A boolean value specifying whether the effect state can be modified.
     */
    canSetState : BOOL

    /**
     * A member of the [AUDIO_EFFECT_STATE](ne-audioclient-audio_effect_state.md) enumeration specifying the state of the audio effect.
     */
    state : AUDIO_EFFECT_STATE

}
