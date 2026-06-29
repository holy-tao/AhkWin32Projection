#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Note  This API is deprecated. New applications should not use it. Defines the direction of data flow for the stream.
 * @remarks
 * Transform streams are read/write where the sample is updated in place.
 * @see https://learn.microsoft.com/windows/win32/api/mmstream/ne-mmstream-stream_type
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct STREAM_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Application can read the stream.
     * @type {Integer (Int32)}
     */
    static STREAMTYPE_READ => 0

    /**
     * Application can write to the stream.
     * @type {Integer (Int32)}
     */
    static STREAMTYPE_WRITE => 1

    /**
     * Application reads and writes to the stream.
     * @type {Integer (Int32)}
     */
    static STREAMTYPE_TRANSFORM => 2
}
