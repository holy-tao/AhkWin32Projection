#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUDIO_SYSTEMEFFECT_STATE.ahk" { AUDIO_SYSTEMEFFECT_STATE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents a System Effects Audio Processing Object (sAPO) audio effect.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_systemeffect
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AUDIO_SYSTEMEFFECT {
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
     * A member of the [AUDIO_SYSTEMEFFECT_STATE](ne-audioengineextensionapo-audio_systemeffect_state.md) enumeration specifying the state of the audio effect.
     */
    state : AUDIO_SYSTEMEFFECT_STATE

}
