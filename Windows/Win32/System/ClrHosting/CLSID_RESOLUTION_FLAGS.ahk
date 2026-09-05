#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class CLSID_RESOLUTION_FLAGS extends Win32Enum {

    /**
     * Native name: CLSID_RESOLUTION_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: CLSID_RESOLUTION_REGISTERED
     * @type {Integer (Int32)}
     */
    static REGISTERED => 1
}
