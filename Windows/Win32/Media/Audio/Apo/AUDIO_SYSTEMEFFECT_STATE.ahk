#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the state of a System Effects Audio Processing Object (sAPO) audio effect.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-audio_systemeffect_state
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_SYSTEMEFFECT_STATE{

    /**
     * The audio effect is off.
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECT_STATE_OFF => 0

    /**
     * The audio effect is on.
     * @type {Integer (Int32)}
     */
    static AUDIO_SYSTEMEFFECT_STATE_ON => 1
}
