#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AUDIO_EFFECT_STATE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Represents an audio effect.
 * @remarks
 * Get a list of **AUDIO_EFFECT** structures by calling [IAudioEffectsManager::GetAudioEffects](nf-audioclient-iaudioeffectsmanager-getaudioeffects.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audio_effect
 * @namespace Windows.Win32.Media.Audio
 */
class AUDIO_EFFECT extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * The GUID identifier for an audio effect. Audio effect GUIDs are defined in [ksmedia.h](/windows-hardware/drivers/audio/ksmedia-h).
     * @type {Guid}
     */
    id {
        get {
            if(!this.HasProp("__id"))
                this.__id := Guid(0, this)
            return this.__id
        }
    }

    /**
     * A boolean value specifying whether the effect state can be modified.
     * @type {BOOL}
     */
    canSetState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A member of the [AUDIO_EFFECT_STATE](ne-audioclient-audio_effect_state.md) enumeration specifying the state of the audio effect.
     * @type {AUDIO_EFFECT_STATE}
     */
    state {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
