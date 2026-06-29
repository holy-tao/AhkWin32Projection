#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the progress of the download of the current update that is returned by the CurrentUpdateDownloadPhase property of the IDownloadProgress interface.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-downloadphase
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct DownloadPhase {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Initializing the download of the current update.
     * @type {Integer (Int32)}
     */
    static dphInitializing => 1

    /**
     * Downloading the current update.
     * @type {Integer (Int32)}
     */
    static dphDownloading => 2

    /**
     * Verifying the download of the current update.
     * @type {Integer (Int32)}
     */
    static dphVerifying => 3
}
