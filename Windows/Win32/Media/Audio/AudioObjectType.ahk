#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of an ISpatialAudioObject.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/ne-spatialaudioclient-audioobjecttype
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AudioObjectType{

    /**
     * The spatial audio object is not spatialized.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_None => 0

    /**
     * The spatial audio object is dynamic. It's spatial properties can be changed over time.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_Dynamic => 1

    /**
     * The spatial audio object is assigned the front left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_FRONT_LEFT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_FrontLeft => 2

    /**
     * The spatial audio object is assigned the front right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_FRONT_RIGHT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_FrontRight => 4

    /**
     * The spatial audio object is assigned the front center channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_FRONT_CENTER.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_FrontCenter => 8

    /**
     * The spatial audio object is assigned the low frequency channel. Because this channel is not spatialized, it does not count toward the system resource limits for spatialized audio objects. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_LOW_FREQUENCY.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_LowFrequency => 16

    /**
     * The spatial audio object is assigned the side left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_SIDE_LEFT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_SideLeft => 32

    /**
     * The spatial audio object is assigned the side right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_SIDE_RIGHT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_SideRight => 64

    /**
     * The spatial audio object is assigned the back left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_BACK_LEFT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_BackLeft => 128

    /**
     * The spatial audio object is assigned the back right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_BACK_RIGHT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_BackRight => 256

    /**
     * The spatial audio object is assigned the top front left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_TOP_FRONT_LEFT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_TopFrontLeft => 512

    /**
     * The spatial audio object is assigned the top front right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_TOP_FRONT_RIGHT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_TopFrontRight => 1024

    /**
     * The spatial audio object is assigned the top back left channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_TOP_BACK_LEFT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_TopBackLeft => 2048

    /**
     * The spatial audio object is assigned the top back right channel. The equivalent channel mask of DirectShow's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a> enumeration is SPEAKER_TOP_BACK_RIGHT.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_TopBackRight => 4096

    /**
     * The spatial audio object is assigned the bottom front left channel.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_BottomFrontLeft => 8192

    /**
     * The spatial audio object is assigned the bottom front right channel.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_BottomFrontRight => 16384

    /**
     * The spatial audio object is assigned the bottom back left channel.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_BottomBackLeft => 32768

    /**
     * The spatial audio object is assigned the bottom back right channel.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_BottomBackRight => 65536

    /**
     * The spatial audio object is assigned the back center channel.
     * @type {Integer (Int32)}
     */
    static AudioObjectType_BackCenter => 131072

    /**
     * @type {Integer (Int32)}
     */
    static AudioObjectType_StereoLeft => 262144

    /**
     * @type {Integer (Int32)}
     */
    static AudioObjectType_StereoRight => 524288
}
