#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class LPPROGRESS_ROUTINE_CALLBACK_REASON extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_CHUNK_FINISHED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_STREAM_SWITCH => 1
}
