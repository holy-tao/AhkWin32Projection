#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an audio effect.
 * @remarks
 * Get a list of **AUDIO_EFFECT** structures by calling [IAudioEffectsManager::GetAudioEffects](nf-audioclient-iaudioeffectsmanager-getaudioeffects.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audio_effect
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIO_EFFECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The GUID identifier for an audio effect. Audio effect GUIDs are defined in [ksmedia.h](/windows-hardware/drivers/audio/ksmedia-h).
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A boolean value specifying whether the effect state can be modified.
     * @type {Integer}
     */
    canSetState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A member of the [AUDIO_EFFECT_STATE](ne-audioclient-audio_effect_state.md) enumeration specifying the state of the audio effect.
     * @type {Integer}
     */
    state {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
