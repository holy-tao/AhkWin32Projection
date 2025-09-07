#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPSubscriptionDownloadState{

    /**
     * @type {Integer (Int32)}
     */
    static wmpsdlsDownloading => 0

    /**
     * @type {Integer (Int32)}
     */
    static wmpsdlsPaused => 1

    /**
     * @type {Integer (Int32)}
     */
    static wmpsdlsProcessing => 2

    /**
     * @type {Integer (Int32)}
     */
    static wmpsdlsCompleted => 3

    /**
     * @type {Integer (Int32)}
     */
    static wmpsdlsCancelled => 4
}
