#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to continue, retry, or stop processing items.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_op_response
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct OFFLINEFILES_OP_RESPONSE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Continue processing items.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OP_CONTINUE => 0

    /**
     * Repeat processing of this item.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OP_RETRY => 1

    /**
     * Stop processing now.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OP_ABORT => 2
}
