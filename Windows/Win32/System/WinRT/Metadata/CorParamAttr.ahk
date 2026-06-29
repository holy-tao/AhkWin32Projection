#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorParamAttr {
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
    static pdIn => 1

    /**
     * @type {Integer (Int32)}
     */
    static pdOut => 2

    /**
     * @type {Integer (Int32)}
     */
    static pdOptional => 16

    /**
     * @type {Integer (Int32)}
     */
    static pdReservedMask => 61440

    /**
     * @type {Integer (Int32)}
     */
    static pdHasDefault => 4096

    /**
     * @type {Integer (Int32)}
     */
    static pdHasFieldMarshal => 8192

    /**
     * @type {Integer (Int32)}
     */
    static pdUnused => 53216
}
