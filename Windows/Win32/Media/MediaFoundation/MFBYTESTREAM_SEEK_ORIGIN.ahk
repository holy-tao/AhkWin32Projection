#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the origin for a seek request.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfbytestream_seek_origin
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFBYTESTREAM_SEEK_ORIGIN {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The seek position is specified relative to the start of the stream.
     * @type {Integer (Int32)}
     */
    static msoBegin => 0

    /**
     * The seek position is specified relative to the current read/write position in the stream.
     * @type {Integer (Int32)}
     */
    static msoCurrent => 1
}
