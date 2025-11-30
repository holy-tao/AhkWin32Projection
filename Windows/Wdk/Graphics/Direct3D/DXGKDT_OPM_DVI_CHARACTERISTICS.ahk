#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKDT_OPM_DVI_CHARACTERISTICS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_DVI_CHARACTERISTIC_1_0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_DVI_CHARACTERISTIC_1_1_OR_ABOVE => 2
}
