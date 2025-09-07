#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class OfflineFolderStatus{

    /**
     * @type {Integer (Int32)}
     */
    static OFS_INACTIVE => -1

    /**
     * @type {Integer (Int32)}
     */
    static OFS_ONLINE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OFS_OFFLINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static OFS_SERVERBACK => 2

    /**
     * @type {Integer (Int32)}
     */
    static OFS_DIRTYCACHE => 3
}
