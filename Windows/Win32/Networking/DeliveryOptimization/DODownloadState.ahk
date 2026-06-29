#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the ID of the current download state, which is part of the **DO_DOWNLOAD_STATUS** structure.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ne-deliveryoptimization-dodownloadstate
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
export default struct DODownloadState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Download object is created but hasn't been started yet.
     * @type {Integer (Int32)}
     */
    static DODownloadState_Created => 0

    /**
     * Download is in progress.
     * @type {Integer (Int32)}
     */
    static DODownloadState_Transferring => 1

    /**
     * Download is transferred and can start again by downloading another portion of the file.
     * @type {Integer (Int32)}
     */
    static DODownloadState_Transferred => 2

    /**
     * Download is finalized and cannot be started again.
     * @type {Integer (Int32)}
     */
    static DODownloadState_Finalized => 3

    /**
     * Download was aborted.
     * @type {Integer (Int32)}
     */
    static DODownloadState_Aborted => 4

    /**
     * Download has been paused on demand or due to transient error.
     * @type {Integer (Int32)}
     */
    static DODownloadState_Paused => 5
}
