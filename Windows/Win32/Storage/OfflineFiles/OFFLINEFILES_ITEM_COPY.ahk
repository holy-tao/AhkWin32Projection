#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the local, remote, or original copy of an item is being queried.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_item_copy
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct OFFLINEFILES_ITEM_COPY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Retrieve the attributes, time values, or size  of the local copy of the item.  If the item is currently offline, this may be different than the attributes associated with the original copy.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_COPY_LOCAL => 0

    /**
     * This enumeration value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_COPY_REMOTE => 1

    /**
     * Retrieve the attributes, time values, or size of the original copy of the item.  The original copy represents the state of the item following the last successful sync of that item, which is the most recent time when the server copy and local copy were identical.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_COPY_ORIGINAL => 2
}
