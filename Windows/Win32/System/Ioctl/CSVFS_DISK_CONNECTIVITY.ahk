#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CSVFS_DISK_CONNECTIVITY{

    /**
     * @type {Integer (Int32)}
     */
    static CsvFsDiskConnectivityNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static CsvFsDiskConnectivityMdsNodeOnly => 1

    /**
     * @type {Integer (Int32)}
     */
    static CsvFsDiskConnectivitySubsetOfNodes => 2

    /**
     * @type {Integer (Int32)}
     */
    static CsvFsDiskConnectivityAllNodes => 3
}
