#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_SET_CONTEXT_OPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FLT_SET_CONTEXT_REPLACE_IF_EXISTS => 0

    /**
     * @type {Integer (Int32)}
     */
    static FLT_SET_CONTEXT_KEEP_IF_EXISTS => 1
}
