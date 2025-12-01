#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the different ready states of the Media Source Extension.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_mse_ready
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MSE_READY extends Win32Enum{

    /**
     * The media source is closed.
     * @type {Integer (Int32)}
     */
    static MF_MSE_READY_CLOSED => 1

    /**
     * The media source is open.
     * @type {Integer (Int32)}
     */
    static MF_MSE_READY_OPEN => 2

    /**
     * The media source is ended.
     * @type {Integer (Int32)}
     */
    static MF_MSE_READY_ENDED => 3
}
