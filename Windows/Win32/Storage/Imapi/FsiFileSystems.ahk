#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for recognized file systems.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/ne-imapi2fs-fsifilesystems
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class FsiFileSystems extends Win32Enum{

    /**
     * The disc does not contain a recognized file system.
     * @type {Integer (Int32)}
     */
    static FsiFileSystemNone => 0

    /**
     * Standard CD file system.
     * @type {Integer (Int32)}
     */
    static FsiFileSystemISO9660 => 1

    /**
     * Joliet file system.
     * @type {Integer (Int32)}
     */
    static FsiFileSystemJoliet => 2

    /**
     * UDF file system.
     * @type {Integer (Int32)}
     */
    static FsiFileSystemUDF => 4

    /**
     * The disc appears to have a file system, but the layout does not match any of the recognized types.
     * @type {Integer (Int32)}
     */
    static FsiFileSystemUnknown => 1073741824
}
