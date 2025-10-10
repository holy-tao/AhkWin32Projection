#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies audio ducking options. Use values from this enumeration when calling IAudioClientDuckingControl::SetDuckingOptionsForCurrentStream
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/ne-audioclient-audio_ducking_options
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIO_DUCKING_OPTIONS{

    /**
     * The associated audio stream should use the default audio ducking behavior.
     * @type {Integer (Int32)}
     */
    static AUDIO_DUCKING_OPTIONS_DEFAULT => 0

    /**
     * The associated audio stream should not cause other streams to be ducked.
     * @type {Integer (Int32)}
     */
    static AUDIO_DUCKING_OPTIONS_DO_NOT_DUCK_OTHER_STREAMS => 1
}
