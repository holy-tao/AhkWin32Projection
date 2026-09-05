#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the different error states of the Media Source Extension.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_mse_error
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MSE_ERROR extends Win32Enum {

    /**
     * Specifies no error.
     * Native name: MF_MSE_ERROR_NOERROR
     * @type {Integer (Int32)}
     */
    static NOERROR => 0

    /**
     * Specifies an error with the network.
     * Native name: MF_MSE_ERROR_NETWORK
     * @type {Integer (Int32)}
     */
    static NETWORK => 1

    /**
     * Specifies an error with decoding.
     * Native name: MF_MSE_ERROR_DECODE
     * @type {Integer (Int32)}
     */
    static DECODE => 2

    /**
     * Specifies an unknown error.
     * Native name: MF_MSE_ERROR_UNKNOWN_ERROR
     * @type {Integer (Int32)}
     */
    static UNKNOWN_ERROR => 3
}
