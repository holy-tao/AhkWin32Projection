#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBSTATUSENUM21 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_DOESNOTEXIST => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_INVALIDURL => 17

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_RESOURCELOCKED => 18

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_RESOURCEEXISTS => 19

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_CANNOTCOMPLETE => 20

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_VOLUMENOTFOUND => 21

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_OUTOFSPACE => 22

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_S_CANNOTDELETESOURCE => 23

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_READONLY => 24

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_E_RESOURCEOUTOFSCOPE => 25

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_S_ALREADYEXISTS => 26
}
