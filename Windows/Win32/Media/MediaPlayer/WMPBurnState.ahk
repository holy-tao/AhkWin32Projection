#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMPBurnState enumeration type defines the possible operational states of Windows Media Player as it burns a CD.
 * @remarks
 * Windows Media Player 10 Mobile: This enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpburnstate
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPBurnState{

    /**
     * Not a valid state.
     * @type {Integer (Int32)}
     */
    static wmpbsUnknown => 0

    /**
     * Windows Media Player is busy. Try again in a moment.
     * @type {Integer (Int32)}
     */
    static wmpbsBusy => 1

    /**
     * Ready to begin burning a CD.
     * @type {Integer (Int32)}
     */
    static wmpbsReady => 2

    /**
     * Waiting for the disc to become available.
     * @type {Integer (Int32)}
     */
    static wmpbsWaitingForDisc => 3

    /**
     * The burn playlist has changed. Call <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcdromburn-refreshstatus">IWMPCdromBurn::refreshStatus</a>.
     * @type {Integer (Int32)}
     */
    static wmpbsRefreshStatusPending => 4

    /**
     * Windows Media Player is preparing to burn the CD.
     * @type {Integer (Int32)}
     */
    static wmpbsPreparingToBurn => 5

    /**
     * The CD is being burned.
     * @type {Integer (Int32)}
     */
    static wmpbsBurning => 6

    /**
     * The burning operation is stopped.
     * @type {Integer (Int32)}
     */
    static wmpbsStopped => 7

    /**
     * Windows Media Player is erasing the CD.
     * @type {Integer (Int32)}
     */
    static wmpbsErasing => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wmpbsDownloading => 9
}
