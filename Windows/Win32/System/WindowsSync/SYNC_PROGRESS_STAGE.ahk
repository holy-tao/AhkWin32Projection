#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the stages of a synchronization session.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ne-winsync-sync_progress_stage
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SYNC_PROGRESS_STAGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
