#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to specify the nState member of the SCOPEDATAITEM structure.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_scope_item_state
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_SCOPE_ITEM_STATE extends Win32Enum{

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
