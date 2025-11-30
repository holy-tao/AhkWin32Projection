#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MPEG2VIDEOINFO_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_DoPanScan => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_DVDLine21Field1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_DVDLine21Field2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_SourceIsLetterboxed => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_FilmCameraMode => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_LetterboxAnalogOut => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_DSS_UserData => 64

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_DVB_UserData => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_27MhzTimebase => 256

    /**
     * @type {Integer (UInt32)}
     */
    static AMMPEG2_WidescreenAnalogOut => 512
}
