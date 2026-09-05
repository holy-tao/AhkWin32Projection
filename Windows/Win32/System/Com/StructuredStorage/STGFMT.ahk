#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
class STGFMT extends Win32Enum {

    /**
     * Native name: STGFMT_STORAGE
     * @type {Integer (UInt32)}
     */
    static STORAGE => 0

    /**
     * Native name: STGFMT_NATIVE
     * @type {Integer (UInt32)}
     */
    static NATIVE => 1

    /**
     * Native name: STGFMT_FILE
     * @type {Integer (UInt32)}
     */
    static FILE => 3

    /**
     * Native name: STGFMT_ANY
     * @type {Integer (UInt32)}
     */
    static ANY => 4

    /**
     * Native name: STGFMT_DOCFILE
     * @type {Integer (UInt32)}
     */
    static DOCFILE => 5

    /**
     * Native name: STGFMT_DOCUMENT
     * @type {Integer (UInt32)}
     */
    static DOCUMENT => 0
}
