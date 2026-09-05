#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class CLS_CONTEXT_MODE extends Win32Enum {

    /**
     * Native name: ClsContextNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: ClsContextUndoNext
     * @type {Integer (Int32)}
     */
    static UndoNext => 1

    /**
     * Native name: ClsContextPrevious
     * @type {Integer (Int32)}
     */
    static Previous => 2

    /**
     * Native name: ClsContextForward
     * @type {Integer (Int32)}
     */
    static Forward => 3
}
