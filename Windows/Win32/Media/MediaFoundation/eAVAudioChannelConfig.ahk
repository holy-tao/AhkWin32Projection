#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the speaker configuration for the audio channels in the audio bit stream. This enumeration is used with the AVAudioChannelConfig property.
 * @remarks
 * These values correspond to the flags used for the <b>dwChannelMask</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavaudiochannelconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVAudioChannelConfig extends Win32Enum {

    /**
     * Front left
     * Native name: eAVAudioChannelConfig_FRONT_LEFT
     * @type {Integer (Int32)}
     */
    static FRONT_LEFT => 1

    /**
     * Front right
     * Native name: eAVAudioChannelConfig_FRONT_RIGHT
     * @type {Integer (Int32)}
     */
    static FRONT_RIGHT => 2

    /**
     * Front center
     * Native name: eAVAudioChannelConfig_FRONT_CENTER
     * @type {Integer (Int32)}
     */
    static FRONT_CENTER => 4

    /**
     * Low frequency effect (LFE)
     * Native name: eAVAudioChannelConfig_LOW_FREQUENCY
     * @type {Integer (Int32)}
     */
    static LOW_FREQUENCY => 8

    /**
     * Back left
     * Native name: eAVAudioChannelConfig_BACK_LEFT
     * @type {Integer (Int32)}
     */
    static BACK_LEFT => 16

    /**
     * Back right
     * Native name: eAVAudioChannelConfig_BACK_RIGHT
     * @type {Integer (Int32)}
     */
    static BACK_RIGHT => 32

    /**
     * Front, left of center
     * Native name: eAVAudioChannelConfig_FRONT_LEFT_OF_CENTER
     * @type {Integer (Int32)}
     */
    static FRONT_LEFT_OF_CENTER => 64

    /**
     * Front, right of center
     * Native name: eAVAudioChannelConfig_FRONT_RIGHT_OF_CENTER
     * @type {Integer (Int32)}
     */
    static FRONT_RIGHT_OF_CENTER => 128

    /**
     * Back center
     * Native name: eAVAudioChannelConfig_BACK_CENTER
     * @type {Integer (Int32)}
     */
    static BACK_CENTER => 256

    /**
     * Side left
     * Native name: eAVAudioChannelConfig_SIDE_LEFT
     * @type {Integer (Int32)}
     */
    static SIDE_LEFT => 512

    /**
     * Side right
     * Native name: eAVAudioChannelConfig_SIDE_RIGHT
     * @type {Integer (Int32)}
     */
    static SIDE_RIGHT => 1024

    /**
     * Top center
     * Native name: eAVAudioChannelConfig_TOP_CENTER
     * @type {Integer (Int32)}
     */
    static TOP_CENTER => 2048

    /**
     * Top, front left
     * Native name: eAVAudioChannelConfig_TOP_FRONT_LEFT
     * @type {Integer (Int32)}
     */
    static TOP_FRONT_LEFT => 4096

    /**
     * Top, front center
     * Native name: eAVAudioChannelConfig_TOP_FRONT_CENTER
     * @type {Integer (Int32)}
     */
    static TOP_FRONT_CENTER => 8192

    /**
     * Top, front right
     * Native name: eAVAudioChannelConfig_TOP_FRONT_RIGHT
     * @type {Integer (Int32)}
     */
    static TOP_FRONT_RIGHT => 16384

    /**
     * Top, back left
     * Native name: eAVAudioChannelConfig_TOP_BACK_LEFT
     * @type {Integer (Int32)}
     */
    static TOP_BACK_LEFT => 32768

    /**
     * Top, back center
     * Native name: eAVAudioChannelConfig_TOP_BACK_CENTER
     * @type {Integer (Int32)}
     */
    static TOP_BACK_CENTER => 65536

    /**
     * Top, back right
     * Native name: eAVAudioChannelConfig_TOP_BACK_RIGHT
     * @type {Integer (Int32)}
     */
    static TOP_BACK_RIGHT => 131072
}
