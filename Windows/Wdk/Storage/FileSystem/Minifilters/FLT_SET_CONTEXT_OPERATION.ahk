#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
class FLT_SET_CONTEXT_OPERATION extends Win32Enum {

    /**
     * Native name: FLT_SET_CONTEXT_REPLACE_IF_EXISTS
     * @type {Integer (Int32)}
     */
    static REPLACE_IF_EXISTS => 0

    /**
     * Native name: FLT_SET_CONTEXT_KEEP_IF_EXISTS
     * @type {Integer (Int32)}
     */
    static KEEP_IF_EXISTS => 1
}
