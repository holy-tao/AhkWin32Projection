#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to specify the nState member of the SCOPEDATAITEM structure.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_scope_item_state
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_SCOPE_ITEM_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not currently used.
     * @type {Integer (Int32)}
     */
    static MMC_SCOPE_ITEM_STATE_NORMAL => 1

    /**
     * Not currently used.
     * @type {Integer (Int32)}
     */
    static MMC_SCOPE_ITEM_STATE_BOLD => 2

    /**
     * Set if the item has been expanded at least once or 0 (zero) if the item has not been expanded.
     * @type {Integer (Int32)}
     */
    static MMC_SCOPE_ITEM_STATE_EXPANDEDONCE => 3
}
