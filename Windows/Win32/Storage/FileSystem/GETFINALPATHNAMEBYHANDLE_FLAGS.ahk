#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class GETFINALPATHNAMEBYHANDLE_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static VOLUME_NAME_DOS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VOLUME_NAME_GUID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VOLUME_NAME_NT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VOLUME_NAME_NONE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NAME_NORMALIZED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NAME_OPENED => 8
}
