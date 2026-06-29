#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The STREAM_SEEK enumeration values specify the origin from which to calculate the new seek-pointer location.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-stream_seek
 * @namespace Windows.Win32.System.Com
 */
export default struct STREAM_SEEK {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The new seek pointer is an offset relative to the beginning of the stream. In this case, the <i>dlibMove</i> parameter is the new seek position relative to the beginning of the stream.
     * @type {Integer (UInt32)}
     */
    static STREAM_SEEK_SET => 0

    /**
     * The new seek pointer is an offset relative to the current seek pointer location. In this case, the <i>dlibMove</i> parameter is the signed displacement from the current seek position.
     * @type {Integer (UInt32)}
     */
    static STREAM_SEEK_CUR => 1

    /**
     * The new seek pointer is an offset relative to the end of the stream. In this case, the <i>dlibMove</i> parameter is the new seek position relative to the end of the stream.
     * @type {Integer (UInt32)}
     */
    static STREAM_SEEK_END => 2
}
