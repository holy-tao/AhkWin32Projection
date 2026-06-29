#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapToneMappingMode {
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
    static WICBitmapToneMappingMode_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapToneMappingMode_Default => 1

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapToneMappingMode_D2D => 2

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapToneMappingMode_GainMap => 3
}
