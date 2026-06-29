#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that describe the characteristics of an audio stream.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ne-audioclient-audclnt_streamoptions
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AUDCLNT_STREAMOPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No stream options.
     * @type {Integer (Int32)}
     */
    static AUDCLNT_STREAMOPTIONS_NONE => 0

    /**
     * The audio stream is a 'raw' stream that bypasses
     *  all signal processing except for endpoint specific,
     *                                   always-on processing in the Audio Processing Object (APO), driver, and hardware.
     * @type {Integer (Int32)}
     */
    static AUDCLNT_STREAMOPTIONS_RAW => 1

    /**
     * The audio client is requesting that the audio engine match the format proposed by the client. The audio engine
     * will match this format only if the format is supported by                                  the audio driver and associated APOs. 
     * 
     * 
     * 
     * Supported in Windows 10 and later.
     * @type {Integer (Int32)}
     */
    static AUDCLNT_STREAMOPTIONS_MATCH_FORMAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_STREAMOPTIONS_AMBISONICS => 4

    /**
     * @type {Integer (Int32)}
     */
    static AUDCLNT_STREAMOPTIONS_POST_VOLUME_LOOPBACK => 8
}
