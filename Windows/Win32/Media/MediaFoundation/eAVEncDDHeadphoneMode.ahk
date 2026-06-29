#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies headphone mode for a Dolby Digital audio stream. This enumeration is used with the AVEncDDHeadphoneMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddheadphonemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncDDHeadphoneMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Headphone mode is not indicated.
     * @type {Integer (Int32)}
     */
    static eAVEncDDHeadphoneMode_NotIndicated => 0

    /**
     * Headphone mode is disabled.
     * @type {Integer (Int32)}
     */
    static eAVEncDDHeadphoneMode_NotEncoded => 1

    /**
     * Headphone mode is enabled.
     * @type {Integer (Int32)}
     */
    static eAVEncDDHeadphoneMode_Encoded => 2
}
