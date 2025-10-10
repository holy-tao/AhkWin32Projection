#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the speaker configuration for the audio channels in the audio bit stream. This enumeration is used with the AVAudioChannelConfig property.
 * @remarks
 * 
  * These values correspond to the flags used for the <b>dwChannelMask</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavaudiochannelconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVAudioChannelConfig{

    /**
     * Front left
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_FRONT_LEFT => 1

    /**
     * Front right
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_FRONT_RIGHT => 2

    /**
     * Front center
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_FRONT_CENTER => 4

    /**
     * Low frequency effect (LFE)
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_LOW_FREQUENCY => 8

    /**
     * Back left
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_BACK_LEFT => 16

    /**
     * Back right
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_BACK_RIGHT => 32

    /**
     * Front, left of center
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_FRONT_LEFT_OF_CENTER => 64

    /**
     * Front, right of center
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_FRONT_RIGHT_OF_CENTER => 128

    /**
     * Back center
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_BACK_CENTER => 256

    /**
     * Side left
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_SIDE_LEFT => 512

    /**
     * Side right
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_SIDE_RIGHT => 1024

    /**
     * Top center
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_TOP_CENTER => 2048

    /**
     * Top, front left
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_TOP_FRONT_LEFT => 4096

    /**
     * Top, front center
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_TOP_FRONT_CENTER => 8192

    /**
     * Top, front right
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_TOP_FRONT_RIGHT => 16384

    /**
     * Top, back left
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_TOP_BACK_LEFT => 32768

    /**
     * Top, back center
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_TOP_BACK_CENTER => 65536

    /**
     * Top, back right
     * @type {Integer (Int32)}
     */
    static eAVAudioChannelConfig_TOP_BACK_RIGHT => 131072
}
