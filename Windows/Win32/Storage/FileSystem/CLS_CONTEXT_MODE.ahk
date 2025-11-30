#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_CONTEXT_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ClsContextNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ClsContextUndoNext => 1

    /**
     * @type {Integer (Int32)}
     */
    static ClsContextPrevious => 2

    /**
     * @type {Integer (Int32)}
     */
    static ClsContextForward => 3
}
