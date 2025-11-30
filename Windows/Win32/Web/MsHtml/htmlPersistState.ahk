#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlPersistState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlPersistStateNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlPersistStateFavorite => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlPersistStateHistory => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlPersistStateSnapshot => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlPersistStateUserData => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlPersistState_Max => 2147483647
}
