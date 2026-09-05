#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various modes for video ports.
 * @see https://learn.microsoft.com/windows/win32/api/vptype/ne-vptype-amvp_mode
 * @namespace Windows.Win32.Media.DirectShow
 */
class AMVP_MODE extends Win32Enum {

    /**
     * Weave.
     * Native name: AMVP_MODE_WEAVE
     * @type {Integer (Int32)}
     */
    static WEAVE => 0

    /**
     * Interleaved bob. Bob mode in which resources are allocated to switch to weave mode, for example, on the next frame.
     * Native name: AMVP_MODE_BOBINTERLEAVED
     * @type {Integer (Int32)}
     */
    static BOBINTERLEAVED => 1

    /**
     * Native name: AMVP_MODE_BOBNONINTERLEAVED
     * @type {Integer (Int32)}
     */
    static BOBNONINTERLEAVED => 2

    /**
     * Skip even fields.
     * Native name: AMVP_MODE_SKIPEVEN
     * @type {Integer (Int32)}
     */
    static SKIPEVEN => 3

    /**
     * Skip odd fields.
     * Native name: AMVP_MODE_SKIPODD
     * @type {Integer (Int32)}
     */
    static SKIPODD => 4
}
