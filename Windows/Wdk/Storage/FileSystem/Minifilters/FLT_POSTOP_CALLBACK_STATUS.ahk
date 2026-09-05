#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
class FLT_POSTOP_CALLBACK_STATUS extends Win32Enum {

    /**
     * Native name: FLT_POSTOP_FINISHED_PROCESSING
     * @type {Integer (Int32)}
     */
    static FINISHED_PROCESSING => 0

    /**
     * Native name: FLT_POSTOP_MORE_PROCESSING_REQUIRED
     * @type {Integer (Int32)}
     */
    static MORE_PROCESSING_REQUIRED => 1

    /**
     * Native name: FLT_POSTOP_DISALLOW_FSFILTER_IO
     * @type {Integer (Int32)}
     */
    static DISALLOW_FSFILTER_IO => 2
}
