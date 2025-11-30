#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class RevokedComponent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static REVOKED_COPP => 0

    /**
     * @type {Integer (Int32)}
     */
    static REVOKED_SAC => 1

    /**
     * @type {Integer (Int32)}
     */
    static REVOKED_APP_STUB => 2

    /**
     * @type {Integer (Int32)}
     */
    static REVOKED_SECURE_PIPELINE => 3

    /**
     * @type {Integer (Int32)}
     */
    static REVOKED_MAX_TYPES => 4
}
