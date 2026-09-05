#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the ID of the current download state, which is part of the **DO_DOWNLOAD_STATUS** structure.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ne-deliveryoptimization-dodownloadstate
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
class DODownloadState extends Win32Enum {

    /**
     * Download object is created but hasn't been started yet.
     * Native name: DODownloadState_Created
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * Download is in progress.
     * Native name: DODownloadState_Transferring
     * @type {Integer (Int32)}
     */
    static Transferring => 1

    /**
     * Download is transferred and can start again by downloading another portion of the file.
     * Native name: DODownloadState_Transferred
     * @type {Integer (Int32)}
     */
    static Transferred => 2

    /**
     * Download is finalized and cannot be started again.
     * Native name: DODownloadState_Finalized
     * @type {Integer (Int32)}
     */
    static Finalized => 3

    /**
     * Download was aborted.
     * Native name: DODownloadState_Aborted
     * @type {Integer (Int32)}
     */
    static Aborted => 4

    /**
     * Download has been paused on demand or due to transient error.
     * Native name: DODownloadState_Paused
     * @type {Integer (Int32)}
     */
    static Paused => 5
}
