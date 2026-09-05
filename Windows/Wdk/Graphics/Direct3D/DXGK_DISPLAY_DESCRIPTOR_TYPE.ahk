#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_DISPLAY_DESCRIPTOR_TYPE extends Win32Enum {

    /**
     * Native name: DXGK_DDT_INVALID
     * @type {Integer (Byte)}
     */
    static DDT_INVALID => 0x00

    /**
     * Native name: DXGK_DDT_EDID
     * @type {Integer (Byte)}
     */
    static DDT_EDID => 0x01

    /**
     * Native name: DXGK_DDT_DISPLAYID
     * @type {Integer (Byte)}
     */
    static DDT_DISPLAYID => 0x02
}
