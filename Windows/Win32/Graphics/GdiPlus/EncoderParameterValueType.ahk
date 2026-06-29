#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct EncoderParameterValueType {
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
    static EncoderParameterValueTypeByte => 1

    /**
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeASCII => 2

    /**
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeShort => 3

    /**
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeLong => 4

    /**
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeRational => 5

    /**
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeLongRange => 6

    /**
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeUndefined => 7

    /**
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypeRationalRange => 8

    /**
     * @type {Integer (Int32)}
     */
    static EncoderParameterValueTypePointer => 9
}
