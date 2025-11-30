#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_AMPixAspectRatio extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_PixAspectRatio_NTSC4x3 => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_PixAspectRatio_NTSC16x9 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_PixAspectRatio_PAL4x3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_PixAspectRatio_PAL16x9 => 3
}
