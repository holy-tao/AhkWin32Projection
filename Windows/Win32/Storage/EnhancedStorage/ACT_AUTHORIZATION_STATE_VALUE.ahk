#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
class ACT_AUTHORIZATION_STATE_VALUE extends Win32Enum {

    /**
     * Native name: ACT_UNAUTHORIZED
     * @type {Integer (Int32)}
     */
    static UNAUTHORIZED => 0

    /**
     * Native name: ACT_AUTHORIZED
     * @type {Integer (Int32)}
     */
    static AUTHORIZED => 1
}
