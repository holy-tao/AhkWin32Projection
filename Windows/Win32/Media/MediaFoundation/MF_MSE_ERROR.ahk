#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the different error states of the Media Source Extension.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_mse_error
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MSE_ERROR{

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
