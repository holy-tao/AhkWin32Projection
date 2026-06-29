#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_CAPABILITY_CLASS_TYPE {
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
    static APPX_CAPABILITY_CLASS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_GENERAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_RESTRICTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_WINDOWS => 4

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_ALL => 7

    /**
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CLASS_CUSTOM => 8
}
