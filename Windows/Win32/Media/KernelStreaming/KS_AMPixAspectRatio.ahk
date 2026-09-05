#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_AMPixAspectRatio extends Win32Enum {

    /**
     * Native name: KS_PixAspectRatio_NTSC4x3
     * @type {Integer (Int32)}
     */
    static NTSC4x3 => 0

    /**
     * Native name: KS_PixAspectRatio_NTSC16x9
     * @type {Integer (Int32)}
     */
    static NTSC16x9 => 1

    /**
     * Native name: KS_PixAspectRatio_PAL4x3
     * @type {Integer (Int32)}
     */
    static PAL4x3 => 2

    /**
     * Native name: KS_PixAspectRatio_PAL16x9
     * @type {Integer (Int32)}
     */
    static PAL16x9 => 3
}
