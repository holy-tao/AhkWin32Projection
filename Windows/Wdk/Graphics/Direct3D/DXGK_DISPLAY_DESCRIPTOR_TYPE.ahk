#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_DISPLAY_DESCRIPTOR_TYPE {
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
