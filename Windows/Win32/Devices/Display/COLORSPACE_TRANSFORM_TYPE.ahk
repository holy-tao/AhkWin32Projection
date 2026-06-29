#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORSPACE_TRANSFORM_TYPE {
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
    static COLORSPACE_TRANSFORM_TYPE_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_RGB256x3x16 => 2

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_DXGI_1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_MATRIX_3x4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_MATRIX_V2 => 5
}
