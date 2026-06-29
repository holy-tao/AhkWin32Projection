#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the type of an item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_item_type
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct OFFLINEFILES_ITEM_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The item is a file.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_TYPE_FILE => 0

    /**
     * The item is a directory.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_TYPE_DIRECTORY => 1

    /**
     * The item is a share.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_TYPE_SHARE => 2

    /**
     * The item is a server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_ITEM_TYPE_SERVER => 3
}
