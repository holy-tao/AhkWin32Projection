#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes conflict item type.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_conflict_item_type
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGR_CONFLICT_ITEM_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The conflict item was updated.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CIT_UPDATED => 1

    /**
     * The conflict item was deleted.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CIT_DELETED => 2
}
