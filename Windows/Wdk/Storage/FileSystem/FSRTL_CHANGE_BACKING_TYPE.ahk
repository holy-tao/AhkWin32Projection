#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FSRTL_CHANGE_BACKING_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ChangeDataControlArea => 0

    /**
     * @type {Integer (Int32)}
     */
    static ChangeImageControlArea => 1

    /**
     * @type {Integer (Int32)}
     */
    static ChangeSharedCacheMap => 2
}
