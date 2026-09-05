#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WM_DM_INTERLACED_TYPE extends Win32Enum {

    /**
     * Native name: WM_DM_NOTINTERLACED
     * @type {Integer (Int32)}
     */
    static NOTINTERLACED => 0

    /**
     * Native name: WM_DM_DEINTERLACE_NORMAL
     * @type {Integer (Int32)}
     */
    static DEINTERLACE_NORMAL => 1

    /**
     * Native name: WM_DM_DEINTERLACE_HALFSIZE
     * @type {Integer (Int32)}
     */
    static DEINTERLACE_HALFSIZE => 2

    /**
     * Native name: WM_DM_DEINTERLACE_HALFSIZEDOUBLERATE
     * @type {Integer (Int32)}
     */
    static DEINTERLACE_HALFSIZEDOUBLERATE => 3

    /**
     * Native name: WM_DM_DEINTERLACE_INVERSETELECINE
     * @type {Integer (Int32)}
     */
    static DEINTERLACE_INVERSETELECINE => 4

    /**
     * Native name: WM_DM_DEINTERLACE_VERTICALHALFSIZEDOUBLERATE
     * @type {Integer (Int32)}
     */
    static DEINTERLACE_VERTICALHALFSIZEDOUBLERATE => 5
}
