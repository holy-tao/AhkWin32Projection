#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether the input audio stream is stereo or dual mono. This enumeration is used with the AVDecAudioDualMono property.
 * @remarks
 * 
 * In dual mono encoding, each channel is encoded separately. In stereo encoding, both channels are encoded together.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavdecaudiodualmono
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecAudioDualMono{

    /**
     * The input bit stream is not dual mono.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMono_IsNotDualMono => 0

    /**
     * The input bit stream is dual mono.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMono_IsDualMono => 1

    /**
     * There is no indication in the bit stream whether the audio is dual mono.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMono_UnSpecified => 2
}
