#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of an item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_item_type
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
class OFFLINEFILES_ITEM_TYPE extends Win32Enum {

    /**
     * The item is a file.
     * Native name: OFFLINEFILES_ITEM_TYPE_FILE
     * @type {Integer (Int32)}
     */
    static FILE => 0

    /**
     * The item is a directory.
     * Native name: OFFLINEFILES_ITEM_TYPE_DIRECTORY
     * @type {Integer (Int32)}
     */
    static DIRECTORY => 1

    /**
     * The item is a share.
     * Native name: OFFLINEFILES_ITEM_TYPE_SHARE
     * @type {Integer (Int32)}
     */
    static SHARE => 2

    /**
     * The item is a server.
     * Native name: OFFLINEFILES_ITEM_TYPE_SERVER
     * @type {Integer (Int32)}
     */
    static SERVER => 3
}
