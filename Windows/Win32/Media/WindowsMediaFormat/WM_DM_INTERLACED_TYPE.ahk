#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_DM_INTERLACED_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_NOTINTERLACED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_DEINTERLACE_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_DEINTERLACE_HALFSIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_DEINTERLACE_HALFSIZEDOUBLERATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_DEINTERLACE_INVERSETELECINE => 4

    /**
     * @type {Integer (Int32)}
     */
    static WM_DM_DEINTERLACE_VERTICALHALFSIZEDOUBLERATE => 5
}
