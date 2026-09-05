#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the IORING API version.
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_version
 * @namespace Windows.Win32.Storage.FileSystem
 */
class IORING_VERSION extends Win32Enum {

    /**
     * Invalid version.
     * Native name: IORING_VERSION_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Version 1.
     * Native name: IORING_VERSION_1
     * @type {Integer (Int32)}
     */
    static 1 => 1

    /**
     * Native name: IORING_VERSION_2
     * @type {Integer (Int32)}
     */
    static 2 => 2

    /**
     * Native name: IORING_VERSION_3
     * @type {Integer (Int32)}
     */
    static 3 => 300

    /**
     * Native name: IORING_VERSION_4
     * @type {Integer (Int32)}
     */
    static 4 => 400
}
