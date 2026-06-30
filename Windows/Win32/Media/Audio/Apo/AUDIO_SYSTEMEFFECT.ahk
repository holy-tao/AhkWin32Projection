#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\AUDIO_SYSTEMEFFECT_STATE.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * Represents a System Effects Audio Processing Object (sAPO) audio effect.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_systemeffect
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class AUDIO_SYSTEMEFFECT extends Win32Struct {
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
     * A member of the [AUDIO_SYSTEMEFFECT_STATE](ne-audioengineextensionapo-audio_systemeffect_state.md) enumeration specifying the state of the audio effect.
     * @type {AUDIO_SYSTEMEFFECT_STATE}
     */
    state {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
