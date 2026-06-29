#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates information about the explicit rating of the media file.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_media_explicit
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_MEDIA_EXPLICIT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The media file is not rated as explicit.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_EXPLICIT_FALSE => 0

    /**
     * The media file is rated as explicit.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_EXPLICIT_TRUE => 1

    /**
     * The media file has an unknown explicit rating.
     * @type {Integer (Int32)}
     */
    static WPC_MEDIA_EXPLICIT_UNKNOWN => 2
}
