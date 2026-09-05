#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the different ready states of the Media Source Extension.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_mse_ready
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MSE_READY extends Win32Enum {

    /**
     * The media source is closed.
     * Native name: MF_MSE_READY_CLOSED
     * @type {Integer (Int32)}
     */
    static CLOSED => 1

    /**
     * The media source is open.
     * Native name: MF_MSE_READY_OPEN
     * @type {Integer (Int32)}
     */
    static OPEN => 2

    /**
     * The media source is ended.
     * Native name: MF_MSE_READY_ENDED
     * @type {Integer (Int32)}
     */
    static ENDED => 3
}
