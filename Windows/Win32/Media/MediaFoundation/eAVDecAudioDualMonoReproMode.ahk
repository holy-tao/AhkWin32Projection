#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the decoder reproduces dual mono audio. This enumeration is used with the AVDecAudioDualMonoReproMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecaudiodualmonorepromode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecAudioDualMonoReproMode extends Win32Enum{

    /**
     * Output channel 1 (Ch1) to the left speaker and channel 2 (Ch2) to the right speaker.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMonoReproMode_STEREO => 0

    /**
     * Output Ch1 to the left and right speakers.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMonoReproMode_LEFT_MONO => 1

    /**
     * Output Ch2 to the left and right speakers.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMonoReproMode_RIGHT_MONO => 2

    /**
     * Mix Ch1 and Ch2 and output the mix to the left and right speakers.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMonoReproMode_MIX_MONO => 3
}
