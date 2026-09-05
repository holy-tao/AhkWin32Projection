#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class LPPROGRESS_ROUTINE_CALLBACK_REASON extends Win32Enum {

    /**
     * Native name: CALLBACK_CHUNK_FINISHED
     * @type {Integer (UInt32)}
     */
    static CHUNK_FINISHED => 0

    /**
     * Native name: CALLBACK_STREAM_SWITCH
     * @type {Integer (UInt32)}
     */
    static STREAM_SWITCH => 1
}
