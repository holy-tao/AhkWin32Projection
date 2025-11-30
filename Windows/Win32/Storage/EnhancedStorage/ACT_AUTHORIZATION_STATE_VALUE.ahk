#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class ACT_AUTHORIZATION_STATE_VALUE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ACT_UNAUTHORIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACT_AUTHORIZED => 1
}
