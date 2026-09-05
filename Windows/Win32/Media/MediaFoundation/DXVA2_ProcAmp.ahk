#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_ProcAmp extends Win32Enum {

    /**
     * Native name: DXVA2_ProcAmp_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: DXVA2_ProcAmp_Brightness
     * @type {Integer (Int32)}
     */
    static Brightness => 1

    /**
     * Native name: DXVA2_ProcAmp_Contrast
     * @type {Integer (Int32)}
     */
    static Contrast => 2

    /**
     * Native name: DXVA2_ProcAmp_Hue
     * @type {Integer (Int32)}
     */
    static Hue => 4

    /**
     * Native name: DXVA2_ProcAmp_Saturation
     * @type {Integer (Int32)}
     */
    static Saturation => 8

    /**
     * Native name: DXVA2_ProcAmp_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 15
}
