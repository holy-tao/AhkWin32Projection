#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_AUVRHP_ROOMMODEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VRHP_SMALLROOM => 0

    /**
     * @type {Integer (Int32)}
     */
    static VRHP_MEDIUMROOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static VRHP_BIGROOM => 2

    /**
     * @type {Integer (Int32)}
     */
    static VRHP_CUSTUMIZEDROOM => 3
}
