#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of output stream produced by a multiplexer. This enumeration is used with the AVEncMuxOutputStreamType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmuxoutput
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncMuxOutput extends Win32Enum {

    /**
     * The multiplexer automatically selects whether to output an elementary stream, a program stream, or  a transport stream.
     * Native name: eAVEncMuxOutputAuto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The multiplexer outputs a program stream.
     * Native name: eAVEncMuxOutputPS
     * @type {Integer (Int32)}
     */
    static OutputPS => 1

    /**
     * The multiplexer outputs a transport stream.
     * Native name: eAVEncMuxOutputTS
     * @type {Integer (Int32)}
     */
    static OutputTS => 2
}
