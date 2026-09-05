#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_DISPLAY_USAGE extends Win32Enum {

    /**
     * Native name: DXGK_DU_INVALID
     * @type {Integer (Byte)}
     */
    static DU_INVALID => 0x00

    /**
     * Native name: DXGK_DU_GENERIC
     * @type {Integer (Byte)}
     */
    static DU_GENERIC => 0x01

    /**
     * Native name: DXGK_DU_AR
     * @type {Integer (Byte)}
     */
    static DU_AR => 0x02

    /**
     * Native name: DXGK_DU_VR
     * @type {Integer (Byte)}
     */
    static DU_VR => 0x03

    /**
     * Native name: DXGK_DU_MEDICAL_IMAGING
     * @type {Integer (Byte)}
     */
    static DU_MEDICAL_IMAGING => 0x04

    /**
     * Native name: DXGK_DU_ACCESSORY
     * @type {Integer (Byte)}
     */
    static DU_ACCESSORY => 0x05

    /**
     * Native name: DXGK_DU_MAX
     * @type {Integer (Byte)}
     */
    static DU_MAX => 0x06
}
