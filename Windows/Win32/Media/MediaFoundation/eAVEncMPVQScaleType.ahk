#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the quantizer scale is linear or non-linear. This enumeration is used with the AVEncMPVQScaleType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvqscaletype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncMPVQScaleType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The encoder selects the quantization scale.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVQScaleType_Auto => 0

    /**
     * The quantization scale is linear.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVQScaleType_Linear => 1

    /**
     * The quantization scale is non-linear.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVQScaleType_NonLinear => 2
}
