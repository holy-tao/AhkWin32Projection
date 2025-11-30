#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmFileConditionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FsrmFileConditionType_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static FsrmFileConditionType_Property => 1
}
