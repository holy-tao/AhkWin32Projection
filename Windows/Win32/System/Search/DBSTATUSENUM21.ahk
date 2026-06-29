#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBSTATUSENUM21 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
