#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class MALLOC_TYPE extends Win32Enum {

    /**
     * Native name: MALLOC_THREADSAFE
     * @type {Integer (Int32)}
     */
    static THREADSAFE => 1

    /**
     * Native name: MALLOC_EXECUTABLE
     * @type {Integer (Int32)}
     */
    static EXECUTABLE => 2
}
