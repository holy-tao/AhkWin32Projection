#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that describe the characteristics of an audio stream.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ne-audioclient-audclnt_streamoptions
 * @namespace Windows.Win32.Media.Audio
 */
class AUDCLNT_STREAMOPTIONS extends Win32BitflagEnum {

    /**
     * No stream options.
     * Native name: AUDCLNT_STREAMOPTIONS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The audio stream is a 'raw' stream that bypasses
     *  all signal processing except for endpoint specific,
     *                                   always-on processing in the Audio Processing Object (APO), driver, and hardware.
     * Native name: AUDCLNT_STREAMOPTIONS_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 1

    /**
     * The audio client is requesting that the audio engine match the format proposed by the client. The audio engine
     * will match this format only if the format is supported by                                  the audio driver and associated APOs. 
     * 
     * 
     * 
     * Supported in Windows 10 and later.
     * Native name: AUDCLNT_STREAMOPTIONS_MATCH_FORMAT
     * @type {Integer (Int32)}
     */
    static MATCH_FORMAT => 2

    /**
     * Native name: AUDCLNT_STREAMOPTIONS_AMBISONICS
     * @type {Integer (Int32)}
     */
    static AMBISONICS => 4

    /**
     * Native name: AUDCLNT_STREAMOPTIONS_POST_VOLUME_LOOPBACK
     * @type {Integer (Int32)}
     */
    static POST_VOLUME_LOOPBACK => 8
}
