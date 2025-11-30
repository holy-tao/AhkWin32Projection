#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class NTCREATEFILE_CREATE_DISPOSITION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPERSEDE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CREATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPEN_IF => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OVERWRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OVERWRITE_IF => 5
}
