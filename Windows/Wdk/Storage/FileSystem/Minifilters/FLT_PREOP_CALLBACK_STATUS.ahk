#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
class FLT_PREOP_CALLBACK_STATUS extends Win32Enum {

    /**
     * Native name: FLT_PREOP_SUCCESS_WITH_CALLBACK
     * @type {Integer (Int32)}
     */
    static SUCCESS_WITH_CALLBACK => 0

    /**
     * Native name: FLT_PREOP_SUCCESS_NO_CALLBACK
     * @type {Integer (Int32)}
     */
    static SUCCESS_NO_CALLBACK => 1

    /**
     * Native name: FLT_PREOP_PENDING
     * @type {Integer (Int32)}
     */
    static PENDING => 2

    /**
     * Native name: FLT_PREOP_DISALLOW_FASTIO
     * @type {Integer (Int32)}
     */
    static DISALLOW_FASTIO => 3

    /**
     * Native name: FLT_PREOP_COMPLETE
     * @type {Integer (Int32)}
     */
    static COMPLETE => 4

    /**
     * Native name: FLT_PREOP_SYNCHRONIZE
     * @type {Integer (Int32)}
     */
    static SYNCHRONIZE => 5

    /**
     * Native name: FLT_PREOP_DISALLOW_FSFILTER_IO
     * @type {Integer (Int32)}
     */
    static DISALLOW_FSFILTER_IO => 6
}
