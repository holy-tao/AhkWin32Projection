#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various modes for video ports.
 * @see https://learn.microsoft.com/windows/win32/api/vptype/ne-vptype-amvp_mode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVP_MODE extends Win32Enum{

    /**
     * Weave.
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_WEAVE => 0

    /**
     * Interleaved bob. Bob mode in which resources are allocated to switch to weave mode, for example, on the next frame.
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_BOBINTERLEAVED => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_BOBNONINTERLEAVED => 2

    /**
     * Skip even fields.
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_SKIPEVEN => 3

    /**
     * Skip odd fields.
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_SKIPODD => 4
}
