#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_DISPLAY_USAGE {
    value : UInt8

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
