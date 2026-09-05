#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of an ISpatialAudioObject.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/ne-spatialaudioclient-audioobjecttype
 * @namespace Windows.Win32.Media.Audio
 */
class AudioObjectType extends Win32BitflagEnum {

    /**
     * The spatial audio object is not spatialized.
     * Native name: AudioObjectType_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The spatial audio object is dynamic. It's spatial properties can be changed over time.
     * Native name: AudioObjectType_Dynamic
     * @type {Integer (Int32)}
     */
    static Dynamic => 1

    /**
     * The spatial audio object is assigned the front left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_FRONT_LEFT.
     * Native name: AudioObjectType_FrontLeft
     * @type {Integer (Int32)}
     */
    static FrontLeft => 2

    /**
     * The spatial audio object is assigned the front right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_FRONT_RIGHT.
     * Native name: AudioObjectType_FrontRight
     * @type {Integer (Int32)}
     */
    static FrontRight => 4

    /**
     * The spatial audio object is assigned the front center channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_FRONT_CENTER.
     * Native name: AudioObjectType_FrontCenter
     * @type {Integer (Int32)}
     */
    static FrontCenter => 8

    /**
     * The spatial audio object is assigned the low frequency channel. Because this channel is not spatialized, it does not count toward the system resource limits for spatialized audio objects. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_LOW_FREQUENCY.
     * Native name: AudioObjectType_LowFrequency
     * @type {Integer (Int32)}
     */
    static LowFrequency => 16

    /**
     * The spatial audio object is assigned the side left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_SIDE_LEFT.
     * Native name: AudioObjectType_SideLeft
     * @type {Integer (Int32)}
     */
    static SideLeft => 32

    /**
     * The spatial audio object is assigned the side right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_SIDE_RIGHT.
     * Native name: AudioObjectType_SideRight
     * @type {Integer (Int32)}
     */
    static SideRight => 64

    /**
     * The spatial audio object is assigned the back left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_BACK_LEFT.
     * Native name: AudioObjectType_BackLeft
     * @type {Integer (Int32)}
     */
    static BackLeft => 128

    /**
     * The spatial audio object is assigned the back right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_BACK_RIGHT.
     * Native name: AudioObjectType_BackRight
     * @type {Integer (Int32)}
     */
    static BackRight => 256

    /**
     * The spatial audio object is assigned the top front left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_TOP_FRONT_LEFT.
     * Native name: AudioObjectType_TopFrontLeft
     * @type {Integer (Int32)}
     */
    static TopFrontLeft => 512

    /**
     * The spatial audio object is assigned the top front right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_TOP_FRONT_RIGHT.
     * Native name: AudioObjectType_TopFrontRight
     * @type {Integer (Int32)}
     */
    static TopFrontRight => 1024

    /**
     * The spatial audio object is assigned the top back left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_TOP_BACK_LEFT.
     * Native name: AudioObjectType_TopBackLeft
     * @type {Integer (Int32)}
     */
    static TopBackLeft => 2048

    /**
     * The spatial audio object is assigned the top back right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_TOP_BACK_RIGHT.
     * Native name: AudioObjectType_TopBackRight
     * @type {Integer (Int32)}
     */
    static TopBackRight => 4096

    /**
     * The spatial audio object is assigned the bottom front left channel.
     * Native name: AudioObjectType_BottomFrontLeft
     * @type {Integer (Int32)}
     */
    static BottomFrontLeft => 8192

    /**
     * The spatial audio object is assigned the bottom front right channel.
     * Native name: AudioObjectType_BottomFrontRight
     * @type {Integer (Int32)}
     */
    static BottomFrontRight => 16384

    /**
     * The spatial audio object is assigned the bottom back left channel.
     * Native name: AudioObjectType_BottomBackLeft
     * @type {Integer (Int32)}
     */
    static BottomBackLeft => 32768

    /**
     * The spatial audio object is assigned the bottom back right channel.
     * Native name: AudioObjectType_BottomBackRight
     * @type {Integer (Int32)}
     */
    static BottomBackRight => 65536

    /**
     * The spatial audio object is assigned the back center channel.
     * Native name: AudioObjectType_BackCenter
     * @type {Integer (Int32)}
     */
    static BackCenter => 131072

    /**
     * Native name: AudioObjectType_StereoLeft
     * @type {Integer (Int32)}
     */
    static StereoLeft => 262144

    /**
     * Native name: AudioObjectType_StereoRight
     * @type {Integer (Int32)}
     */
    static StereoRight => 524288
}
