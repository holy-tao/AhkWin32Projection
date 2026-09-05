#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_DISPLAY_TECHNOLOGY extends Win32Enum {

    /**
     * Native name: DXGK_DT_INVALID
     * @type {Integer (Byte)}
     */
    static DT_INVALID => 0x00

    /**
     * Native name: DXGK_DT_OTHER
     * @type {Integer (Byte)}
     */
    static DT_OTHER => 0x01

    /**
     * Native name: DXGK_DT_LCD
     * @type {Integer (Byte)}
     */
    static DT_LCD => 0x02

    /**
     * Native name: DXGK_DT_OLED
     * @type {Integer (Byte)}
     */
    static DT_OLED => 0x03

    /**
     * Native name: DXGK_DT_PROJECTOR
     * @type {Integer (Byte)}
     */
    static DT_PROJECTOR => 0x04

    /**
     * Native name: DXGK_DT_MAX
     * @type {Integer (Byte)}
     */
    static DT_MAX => 0x05
}
