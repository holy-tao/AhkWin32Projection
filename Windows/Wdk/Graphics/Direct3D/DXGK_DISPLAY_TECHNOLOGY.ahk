#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_DISPLAY_TECHNOLOGY extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DT_INVALID => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DT_OTHER => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DT_LCD => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DT_OLED => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DT_PROJECTOR => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DT_MAX => 0x05
}
