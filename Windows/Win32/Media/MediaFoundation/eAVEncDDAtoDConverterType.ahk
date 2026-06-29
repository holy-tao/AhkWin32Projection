#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of analog-to-digital (A/D) conversion for a Dolby Digital audio stream. This enumeration is used with the AVEncDDAtoDConverterType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddatodconvertertype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncDDAtoDConverterType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Standard.
     * @type {Integer (Int32)}
     */
    static eAVEncDDAtoDConverterType_Standard => 0

    /**
     * High Definition Compatible Digital (HDCD).
     * @type {Integer (Int32)}
     */
    static eAVEncDDAtoDConverterType_HDCD => 1
}
