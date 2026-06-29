#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the different error states of the Media Source Extension.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_mse_error
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MSE_ERROR {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies no error.
     * @type {Integer (Int32)}
     */
    static MF_MSE_ERROR_NOERROR => 0

    /**
     * Specifies an error with the network.
     * @type {Integer (Int32)}
     */
    static MF_MSE_ERROR_NETWORK => 1

    /**
     * Specifies an error with decoding.
     * @type {Integer (Int32)}
     */
    static MF_MSE_ERROR_DECODE => 2

    /**
     * Specifies an unknown error.
     * @type {Integer (Int32)}
     */
    static MF_MSE_ERROR_UNKNOWN_ERROR => 3
}
