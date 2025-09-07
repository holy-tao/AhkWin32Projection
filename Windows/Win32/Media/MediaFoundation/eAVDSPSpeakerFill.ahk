#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether speaker fill is enabled in an audio decoder or digital signal processor (DSP).
 * @remarks
 * Speaker fill is a DSP process that converts mono or stereo audio into multichannel audio.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdspspeakerfill
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDSPSpeakerFill{

    /**
     * Speaker fill is disabled.
     * @type {Integer (Int32)}
     */
    static eAVDSPSpeakerFill_OFF => 0

    /**
     * Speaker fill is enabled.
     * @type {Integer (Int32)}
     */
    static eAVDSPSpeakerFill_ON => 1

    /**
     * The decoder or DSP automatically selects the speaker fill mode.
     * @type {Integer (Int32)}
     */
    static eAVDSPSpeakerFill_AUTO => 2
}
