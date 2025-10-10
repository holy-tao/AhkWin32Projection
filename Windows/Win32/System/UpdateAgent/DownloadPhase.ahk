#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the progress of the download of the current update that is returned by the CurrentUpdateDownloadPhase property of the IDownloadProgress interface.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-downloadphase
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class DownloadPhase{

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
