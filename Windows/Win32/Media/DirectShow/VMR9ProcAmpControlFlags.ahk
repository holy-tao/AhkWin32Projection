#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9ProcAmpControlFlags enumeration type specifies image adjustment properties, for use with the Video Mixing Render Filter 9 (VMR-9).
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9procampcontrolflags
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMR9ProcAmpControlFlags extends Win32Enum {

    /**
     * Brightness adjustment.
     * Native name: ProcAmpControl9_Brightness
     * @type {Integer (Int32)}
     */
    static Control9_Brightness => 1

    /**
     * Contrast adjustment.
     * Native name: ProcAmpControl9_Contrast
     * @type {Integer (Int32)}
     */
    static Control9_Contrast => 2

    /**
     * Hue adjustment.
     * Native name: ProcAmpControl9_Hue
     * @type {Integer (Int32)}
     */
    static Control9_Hue => 4

    /**
     * Saturation adjustment.
     * Native name: ProcAmpControl9_Saturation
     * @type {Integer (Int32)}
     */
    static Control9_Saturation => 8

    /**
     * Bitwise <b>OR</b> of all the previous flags. This value is used internally by the VMR-9, and is not a valid flag.
     * Native name: ProcAmpControl9_Mask
     * @type {Integer (Int32)}
     */
    static Control9_Mask => 15
}
