#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the IORING API version.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_version
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_VERSION{

    /**
     * Invalid version.
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_INVALID => 0

    /**
     * Version 1.
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_3 => 300

    /**
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_4 => 400
}
