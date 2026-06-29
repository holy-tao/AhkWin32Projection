#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorCallingConvention {
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
    static IMAGE_CEE_CS_CALLCONV_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_VARARG => 5

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_FIELD => 6

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_LOCAL_SIG => 7

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_PROPERTY => 8

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_UNMGD => 9

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_GENERICINST => 10

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_NATIVEVARARG => 11

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_MAX => 12

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_MASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_HASTHIS => 32

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_EXPLICITTHIS => 64

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_CALLCONV_GENERIC => 16
}
