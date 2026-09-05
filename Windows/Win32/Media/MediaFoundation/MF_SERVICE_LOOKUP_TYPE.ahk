#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_SERVICE_LOOKUP_TYPE extends Win32Enum {

    /**
     * Native name: MF_SERVICE_LOOKUP_UPSTREAM
     * @type {Integer (Int32)}
     */
    static UPSTREAM => 0

    /**
     * Native name: MF_SERVICE_LOOKUP_UPSTREAM_DIRECT
     * @type {Integer (Int32)}
     */
    static UPSTREAM_DIRECT => 1

    /**
     * Native name: MF_SERVICE_LOOKUP_DOWNSTREAM
     * @type {Integer (Int32)}
     */
    static DOWNSTREAM => 2

    /**
     * Native name: MF_SERVICE_LOOKUP_DOWNSTREAM_DIRECT
     * @type {Integer (Int32)}
     */
    static DOWNSTREAM_DIRECT => 3

    /**
     * Native name: MF_SERVICE_LOOKUP_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 4

    /**
     * Native name: MF_SERVICE_LOOKUP_GLOBAL
     * @type {Integer (Int32)}
     */
    static GLOBAL => 5
}
