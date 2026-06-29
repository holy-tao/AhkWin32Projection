#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of output stream produced by a multiplexer. This enumeration is used with the AVEncMuxOutputStreamType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmuxoutput
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncMuxOutput {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The multiplexer automatically selects whether to output an elementary stream, a program stream, or  a transport stream.
     * @type {Integer (Int32)}
     */
    static eAVEncMuxOutputAuto => 0

    /**
     * The multiplexer outputs a program stream.
     * @type {Integer (Int32)}
     */
    static eAVEncMuxOutputPS => 1

    /**
     * The multiplexer outputs a transport stream.
     * @type {Integer (Int32)}
     */
    static eAVEncMuxOutputTS => 2
}
