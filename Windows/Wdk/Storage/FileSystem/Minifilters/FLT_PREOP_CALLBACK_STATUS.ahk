#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_PREOP_CALLBACK_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_SUCCESS_WITH_CALLBACK => 0

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_SUCCESS_NO_CALLBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_PENDING => 2

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_DISALLOW_FASTIO => 3

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_COMPLETE => 4

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_SYNCHRONIZE => 5

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_DISALLOW_FSFILTER_IO => 6
}
