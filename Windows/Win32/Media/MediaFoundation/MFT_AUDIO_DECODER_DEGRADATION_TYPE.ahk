#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFT_AUDIO_DECODER_DEGRADATION_TYPE extends Win32Enum {

    /**
     * Native name: MFT_AUDIO_DECODER_DEGRADATION_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX2CHANNEL
     * @type {Integer (Int32)}
     */
    static DOWNMIX2CHANNEL => 1

    /**
     * Native name: MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX6CHANNEL
     * @type {Integer (Int32)}
     */
    static DOWNMIX6CHANNEL => 2

    /**
     * Native name: MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX8CHANNEL
     * @type {Integer (Int32)}
     */
    static DOWNMIX8CHANNEL => 3
}
