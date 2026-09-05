#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlPersistState extends Win32Enum {

    /**
     * Native name: htmlPersistStateNormal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: htmlPersistStateFavorite
     * @type {Integer (Int32)}
     */
    static Favorite => 1

    /**
     * Native name: htmlPersistStateHistory
     * @type {Integer (Int32)}
     */
    static History => 2

    /**
     * Native name: htmlPersistStateSnapshot
     * @type {Integer (Int32)}
     */
    static Snapshot => 3

    /**
     * Native name: htmlPersistStateUserData
     * @type {Integer (Int32)}
     */
    static UserData => 4

    /**
     * Native name: htmlPersistState_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
