#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmFileConditionType extends Win32Enum {

    /**
     * Native name: FsrmFileConditionType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: FsrmFileConditionType_Property
     * @type {Integer (Int32)}
     */
    static Property => 1
}
