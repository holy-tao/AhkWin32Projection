#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_POSTOP_CALLBACK_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FLT_POSTOP_FINISHED_PROCESSING => 0

    /**
     * @type {Integer (Int32)}
     */
    static FLT_POSTOP_MORE_PROCESSING_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FLT_POSTOP_DISALLOW_FSFILTER_IO => 2
}
