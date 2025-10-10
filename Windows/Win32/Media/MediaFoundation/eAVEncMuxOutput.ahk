#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of output stream produced by a multiplexer. This enumeration is used with the AVEncMuxOutputStreamType property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencmuxoutput
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMuxOutput{

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
