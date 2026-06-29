#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates what kind of content the subpicture stream contains.
 * @remarks
 * Most subpicture streams contain language-related content such as movie subtitles, but subpictures can also be used for the bouncing ball in karaoke or other non-language-related purposes.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_subpicture_coding
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_SUBPICTURE_CODING {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the subpicture uses run length encoding.
     * @type {Integer (Int32)}
     */
    static DVD_SPCoding_RunLength => 0

    /**
     * Indicates that subpicture uses extended encoding.
     * @type {Integer (Int32)}
     */
    static DVD_SPCoding_Extended => 1

    /**
     * Indicates that the subpicture uses some other encoding scheme.
     * @type {Integer (Int32)}
     */
    static DVD_SPCoding_Other => 2
}
