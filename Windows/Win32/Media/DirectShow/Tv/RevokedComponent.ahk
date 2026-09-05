#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class RevokedComponent extends Win32Enum {

    /**
     * Native name: REVOKED_COPP
     * @type {Integer (Int32)}
     */
    static COPP => 0

    /**
     * Native name: REVOKED_SAC
     * @type {Integer (Int32)}
     */
    static SAC => 1

    /**
     * Native name: REVOKED_APP_STUB
     * @type {Integer (Int32)}
     */
    static APP_STUB => 2

    /**
     * Native name: REVOKED_SECURE_PIPELINE
     * @type {Integer (Int32)}
     */
    static SECURE_PIPELINE => 3

    /**
     * Native name: REVOKED_MAX_TYPES
     * @type {Integer (Int32)}
     */
    static MAX_TYPES => 4
}
