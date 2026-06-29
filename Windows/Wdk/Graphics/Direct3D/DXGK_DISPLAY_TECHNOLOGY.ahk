#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_DISPLAY_TECHNOLOGY {
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
