#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the video decoding speed. This enumeration is used with the AVDecVideoFastDecodeMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavfastdecodemode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVFastDecodeMode extends Win32Enum{

    /**
     * Use normal decoding.
     * @type {Integer (Int32)}
     */
    static eVideoDecodeCompliant => 0

    /**
     * Use the optimal loop filter.
     * @type {Integer (Int32)}
     */
    static eVideoDecodeOptimalLF => 1

    /**
     * Disable the loop filter.
     * @type {Integer (Int32)}
     */
    static eVideoDecodeDisableLF => 2

    /**
     * Use the fastest decoding mode.
     * @type {Integer (Int32)}
     */
    static eVideoDecodeFastest => 32
}
