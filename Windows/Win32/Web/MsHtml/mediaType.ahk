#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct mediaType {
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
    static mediaTypeNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypeAll => 511

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypeAural => 1

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypeBraille => 2

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypeEmbossed => 4

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypeHandheld => 8

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypePrint => 16

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypeProjection => 32

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypeScreen => 64

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypeTty => 128

    /**
     * @type {Integer (Int32)}
     */
    static mediaTypeTv => 256

    /**
     * @type {Integer (Int32)}
     */
    static mediaType_Max => 2147483647
}
