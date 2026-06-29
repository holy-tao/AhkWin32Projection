#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MPEG2VIDEOINFO_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
