#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates information about the type of media file accessed.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_media_type
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_MEDIA_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The type of media file accessed is not one of the types available.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_TYPE_OTHER => 0

    /**
     * The type of media file accessed is a DVD.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_TYPE_DVD => 1

    /**
     * The type of media file accessed is recorded television.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_TYPE_RECORDED_TV => 2

    /**
     * The type of media file accessed is an audio file other than a CD audio file.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_TYPE_AUDIO_FILE => 3

    /**
     * The type of media file accessed is a CD audio file.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_TYPE_CD_AUDIO => 4

    /**
     * The type of media file accessed is a video file.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_TYPE_VIDEO_FILE => 5

    /**
     * The type of media file accessed is a picture file.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_TYPE_PICTURE_FILE => 6

    /**
     * The type of media file accessed is a .max file.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_TYPE_MAX => 7
}
