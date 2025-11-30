#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_ProcAmp extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_ProcAmp_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_ProcAmp_Brightness => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_ProcAmp_Contrast => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_ProcAmp_Hue => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_ProcAmp_Saturation => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_ProcAmp_Mask => 15
}
