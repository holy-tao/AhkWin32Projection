#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFT_AUDIO_DECODER_DEGRADATION_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX2CHANNEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX6CHANNEL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX8CHANNEL => 3
}
