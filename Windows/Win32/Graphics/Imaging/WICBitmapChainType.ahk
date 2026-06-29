#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapChainType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapChainType_Alternate => 1

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapChainType_Layer => 2

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapChainType_Preview => 3

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapChainType_Thumbnail => 4

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapChainType_AlphaMap => 5

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapChainType_DepthMap => 6

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapChainType_GainMap => 7
}
