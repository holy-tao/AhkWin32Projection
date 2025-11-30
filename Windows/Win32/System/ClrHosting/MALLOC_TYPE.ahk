#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class MALLOC_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MALLOC_THREADSAFE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MALLOC_EXECUTABLE => 2
}
