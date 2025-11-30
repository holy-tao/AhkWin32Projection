#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_DISPLAY_DESCRIPTOR_TYPE extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DDT_INVALID => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DDT_EDID => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DDT_DISPLAYID => 0x02
}
