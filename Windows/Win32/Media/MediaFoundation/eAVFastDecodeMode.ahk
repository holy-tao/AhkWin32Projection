#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the video decoding speed. This enumeration is used with the AVDecVideoFastDecodeMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavfastdecodemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVFastDecodeMode extends Win32Enum {

    /**
     * Use normal decoding.
     * Native name: eVideoDecodeCompliant
     * @type {Integer (Int32)}
     */
    static VideoDecodeCompliant => 0

    /**
     * Use the optimal loop filter.
     * Native name: eVideoDecodeOptimalLF
     * @type {Integer (Int32)}
     */
    static VideoDecodeOptimalLF => 1

    /**
     * Disable the loop filter.
     * Native name: eVideoDecodeDisableLF
     * @type {Integer (Int32)}
     */
    static VideoDecodeDisableLF => 2

    /**
     * Use the fastest decoding mode.
     * Native name: eVideoDecodeFastest
     * @type {Integer (Int32)}
     */
    static VideoDecodeFastest => 32
}
