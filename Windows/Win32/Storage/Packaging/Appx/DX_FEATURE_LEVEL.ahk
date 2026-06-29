#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct DX_FEATURE_LEVEL {
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
    static DX_FEATURE_LEVEL_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DX_FEATURE_LEVEL_9 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DX_FEATURE_LEVEL_10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DX_FEATURE_LEVEL_11 => 3
}
