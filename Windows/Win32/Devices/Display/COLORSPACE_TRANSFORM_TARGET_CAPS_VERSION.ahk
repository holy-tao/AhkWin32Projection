#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORSPACE_TRANSFORM_TARGET_CAPS_VERSION {
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
    static COLORSPACE_TRANSFORM_VERSION_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_VERSION_NOT_SUPPORTED => 0
}
