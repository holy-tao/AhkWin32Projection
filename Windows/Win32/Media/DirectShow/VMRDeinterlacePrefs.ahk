#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMRDeinterlacePrefs enumeration type describes the deinterlacing method that the Video Mixing Renderer Filter 7 (VMR-7) uses if the method set by the application cannot be used.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vmrdeinterlaceprefs
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRDeinterlacePrefs extends Win32Enum{

    /**
     * Use the next best mode offered by the driver.
     * @type {Integer (Int32)}
     */
    static DeinterlacePref_NextBest => 1

    /**
     * Use the bob method.
     * @type {Integer (Int32)}
     */
    static DeinterlacePref_BOB => 2

    /**
     * Use the weave method (that is, no deinterlacing).
     * @type {Integer (Int32)}
     */
    static DeinterlacePref_Weave => 4

    /**
     * Bitwise <b>OR</b> of the previous flags. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static DeinterlacePref_Mask => 7
}
