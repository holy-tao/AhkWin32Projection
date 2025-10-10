#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the stages of a synchronization session.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ne-winsync-sync_progress_stage
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_PROGRESS_STAGE{

    /**
     * Changes are being detected on the source replica.
     * @type {Integer (Int32)}
     */
    static SPS_CHANGE_DETECTION => 0

    /**
     * Changes from the source replica are being enumerated.
     * @type {Integer (Int32)}
     */
    static SPS_CHANGE_ENUMERATION => 1

    /**
     * Changes are being applied to the destination replica.
     * @type {Integer (Int32)}
     */
    static SPS_CHANGE_APPLICATION => 2
}
