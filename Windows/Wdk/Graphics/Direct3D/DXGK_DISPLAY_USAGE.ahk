#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_DISPLAY_USAGE extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DU_INVALID => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DU_GENERIC => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DU_AR => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DU_VR => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DU_MEDICAL_IMAGING => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DU_ACCESSORY => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static DXGK_DU_MAX => 0x06
}
