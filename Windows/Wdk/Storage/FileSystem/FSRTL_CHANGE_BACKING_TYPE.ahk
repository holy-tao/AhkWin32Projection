#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FSRTL_CHANGE_BACKING_TYPE extends Win32Enum {

    /**
     * Native name: ChangeDataControlArea
     * @type {Integer (Int32)}
     */
    static DataControlArea => 0

    /**
     * Native name: ChangeImageControlArea
     * @type {Integer (Int32)}
     */
    static ImageControlArea => 1

    /**
     * Native name: ChangeSharedCacheMap
     * @type {Integer (Int32)}
     */
    static SharedCacheMap => 2
}
