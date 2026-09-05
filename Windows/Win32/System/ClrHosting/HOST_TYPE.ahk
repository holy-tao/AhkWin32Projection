#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class HOST_TYPE extends Win32Enum {

    /**
     * Native name: HOST_TYPE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: HOST_TYPE_APPLAUNCH
     * @type {Integer (Int32)}
     */
    static APPLAUNCH => 1

    /**
     * Native name: HOST_TYPE_CORFLAG
     * @type {Integer (Int32)}
     */
    static CORFLAG => 2
}
