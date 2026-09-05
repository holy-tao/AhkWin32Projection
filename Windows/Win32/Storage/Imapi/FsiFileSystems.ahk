#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for recognized file systems.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/ne-imapi2fs-fsifilesystems
 * @namespace Windows.Win32.Storage.Imapi
 */
class FsiFileSystems extends Win32Enum {

    /**
     * The disc does not contain a recognized file system.
     * Native name: FsiFileSystemNone
     * @type {Integer (Int32)}
     */
    static SystemNone => 0

    /**
     * Standard CD file system.
     * Native name: FsiFileSystemISO9660
     * @type {Integer (Int32)}
     */
    static SystemISO9660 => 1

    /**
     * Joliet file system.
     * Native name: FsiFileSystemJoliet
     * @type {Integer (Int32)}
     */
    static SystemJoliet => 2

    /**
     * UDF file system.
     * Native name: FsiFileSystemUDF
     * @type {Integer (Int32)}
     */
    static SystemUDF => 4

    /**
     * The disc appears to have a file system, but the layout does not match any of the recognized types.
     * Native name: FsiFileSystemUnknown
     * @type {Integer (Int32)}
     */
    static SystemUnknown => 1073741824
}
