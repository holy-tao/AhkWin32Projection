#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class KMT_DISPLAY_UMD_VERSION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DISPLAY_UMDVERSION_1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static NUM_KMT_DISPLAY_UMDVERSIONS => 1
}
