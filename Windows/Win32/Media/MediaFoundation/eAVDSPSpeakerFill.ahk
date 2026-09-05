#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether speaker fill is enabled in an audio decoder or digital signal processor (DSP).
 * @remarks
 * Speaker fill is a DSP process that converts mono or stereo audio into multichannel audio.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdspspeakerfill
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDSPSpeakerFill extends Win32Enum {

    /**
     * Speaker fill is disabled.
     * Native name: eAVDSPSpeakerFill_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Speaker fill is enabled.
     * Native name: eAVDSPSpeakerFill_ON
     * @type {Integer (Int32)}
     */
    static ON => 1

    /**
     * The decoder or DSP automatically selects the speaker fill mode.
     * Native name: eAVDSPSpeakerFill_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 2
}
