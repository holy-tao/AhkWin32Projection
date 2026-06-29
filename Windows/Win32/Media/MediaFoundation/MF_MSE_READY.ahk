#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the different ready states of the Media Source Extension.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_mse_ready
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MSE_READY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
