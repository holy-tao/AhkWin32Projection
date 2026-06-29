#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the encoder converts the frame rate, if the output frame rate does not match the input frame rate. This enumeration is used with the AVEncVideoOutputFrameRateConversion property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideooutputframerateconversion
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncVideoOutputFrameRateConversion {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Disable frame rate conversion.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputFrameRateConversion_Disable => 0

    /**
     * Enable frame rate conversion.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputFrameRateConversion_Enable => 1

    /**
     * Change the time stamps on the samples, but do not interpolate the time stamps.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputFrameRateConversion_Alias => 2
}
