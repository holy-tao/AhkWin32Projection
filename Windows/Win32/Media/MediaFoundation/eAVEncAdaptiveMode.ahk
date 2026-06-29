#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the adaptive encoding mode for a video encoder.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencadaptivemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncAdaptiveMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not perform adaptive encoding.
     * @type {Integer (Int32)}
     */
    static eAVEncAdaptiveMode_None => 0

    /**
     * Adaptively change the frame resolution.
     * @type {Integer (Int32)}
     */
    static eAVEncAdaptiveMode_Resolution => 1

    /**
     * Adaptively change the frame rate.
     * @type {Integer (Int32)}
     */
    static eAVEncAdaptiveMode_FrameRate => 2
}
