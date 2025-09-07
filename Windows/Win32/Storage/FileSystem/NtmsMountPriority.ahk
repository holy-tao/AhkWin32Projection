#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsMountPriority{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PRIORITY_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PRIORITY_HIGHEST => 15

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PRIORITY_HIGH => 7

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PRIORITY_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PRIORITY_LOW => -7

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PRIORITY_LOWEST => -15
}
