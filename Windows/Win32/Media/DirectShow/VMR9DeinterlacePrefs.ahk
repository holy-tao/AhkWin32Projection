#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9DeinterlacePrefs enumeration type describes the deinterlacing method that the Video Mixing Renderer Filter 9 (VMR-9) uses if the method set by the application cannot be used.
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ne-vmr9-vmr9deinterlaceprefs
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9DeinterlacePrefs extends Win32Enum{

    /**
     * Use the next best mode offered by the driver.
     * @type {Integer (Int32)}
     */
    static DeinterlacePref9_NextBest => 1

    /**
     * Use the bob method.
     * @type {Integer (Int32)}
     */
    static DeinterlacePref9_BOB => 2

    /**
     * Use the weave method (that is, no deinterlacing).
     * @type {Integer (Int32)}
     */
    static DeinterlacePref9_Weave => 4

    /**
     * Bitwise OR of the previous flags. This value is used internally by the VMR, and is not a valid flag.
     * @type {Integer (Int32)}
     */
    static DeinterlacePref9_Mask => 7
}
