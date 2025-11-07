#Requires AutoHotkey v2.0.0 64-bit

/**
 * The APO_FLAG enumeration defines constants that are used as flags by an audio processing object (APO).
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/ne-audioenginebaseapo-apo_flag
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_FLAG{

    /**
     * Indicates that there are no flags enabled for this APO.
     * @type {Integer (Int32)}
     */
    static APO_FLAG_NONE => 0

    /**
     * Indicates that this APO can perform in-place processing. This allows the processor to use a common buffer for input and output.
     * @type {Integer (Int32)}
     */
    static APO_FLAG_INPLACE => 1

    /**
     * Indicates that the samples per frame for the input and output connections must match.
     * @type {Integer (Int32)}
     */
    static APO_FLAG_SAMPLESPERFRAME_MUST_MATCH => 2

    /**
     * Indicates that the frames per second for the input and output connections must match.
     * @type {Integer (Int32)}
     */
    static APO_FLAG_FRAMESPERSECOND_MUST_MATCH => 4

    /**
     * Indicates that bits per sample AND bytes per sample container for the  input and output connections must match.
     * @type {Integer (Int32)}
     */
    static APO_FLAG_BITSPERSAMPLE_MUST_MATCH => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static APO_FLAG_MIXER => 16

    /**
     * The value of this member is determined by the logical OR result of the three preceding members. In other words:
     * 
     * APO_FLAG_DEFAULT = ( APO_FLAG_SAMPLESPERFRAME_MUST_MATCH | APO_FLAG_FRAMESPERSECOND_MUST_MATCH | APO_FLAG_BITSPERSAMPLE_MUST_MATCH ).
     * @type {Integer (Int32)}
     */
    static APO_FLAG_DEFAULT => 14
}
