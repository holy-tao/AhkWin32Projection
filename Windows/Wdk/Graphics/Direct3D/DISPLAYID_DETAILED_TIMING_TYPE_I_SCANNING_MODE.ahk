#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DISPLAYID_DETAILED_TIMING_TYPE_I_SCANNING_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_Progressive => 0

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_Interlaced => 1
}
