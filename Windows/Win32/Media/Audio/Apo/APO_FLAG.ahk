#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The APO_FLAG enumeration defines constants that are used as flags by an audio processing object (APO).
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ne-audioenginebaseapo-apo_flag
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class APO_FLAG extends Win32Enum {

    /**
     * Indicates that there are no flags enabled for this APO.
     * Native name: APO_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Indicates that this APO can perform in-place processing. This allows the processor to use a common buffer for input and output.
     * Native name: APO_FLAG_INPLACE
     * @type {Integer (Int32)}
     */
    static INPLACE => 1

    /**
     * Indicates that the samples per frame for the input and output connections must match.
     * Native name: APO_FLAG_SAMPLESPERFRAME_MUST_MATCH
     * @type {Integer (Int32)}
     */
    static SAMPLESPERFRAME_MUST_MATCH => 2

    /**
     * Indicates that the frames per second for the input and output connections must match.
     * Native name: APO_FLAG_FRAMESPERSECOND_MUST_MATCH
     * @type {Integer (Int32)}
     */
    static FRAMESPERSECOND_MUST_MATCH => 4

    /**
     * Indicates that bits per sample AND bytes per sample container for the  input and output connections must match.
     * Native name: APO_FLAG_BITSPERSAMPLE_MUST_MATCH
     * @type {Integer (Int32)}
     */
    static BITSPERSAMPLE_MUST_MATCH => 8

    /**
     * Native name: APO_FLAG_MIXER
     * @type {Integer (Int32)}
     */
    static MIXER => 16

    /**
     * The value of this member is determined by the logical OR result of the three preceding members. In other words:
     * 
     * APO_FLAG_DEFAULT = ( APO_FLAG_SAMPLESPERFRAME_MUST_MATCH | APO_FLAG_FRAMESPERSECOND_MUST_MATCH | APO_FLAG_BITSPERSAMPLE_MUST_MATCH ).
     * Native name: APO_FLAG_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 14
}
