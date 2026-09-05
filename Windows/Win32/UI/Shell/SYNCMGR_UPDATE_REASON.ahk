#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGR_UPDATE_REASON extends Win32Enum {

    /**
     * Native name: SYNCMGR_UR_ADDED
     * @type {Integer (Int32)}
     */
    static UR_ADDED => 0

    /**
     * Native name: SYNCMGR_UR_CHANGED
     * @type {Integer (Int32)}
     */
    static UR_CHANGED => 1

    /**
     * Native name: SYNCMGR_UR_REMOVED
     * @type {Integer (Int32)}
     */
    static UR_REMOVED => 2

    /**
     * Native name: SYNCMGR_UR_MAX
     * @type {Integer (Int32)}
     */
    static UR_MAX => 2
}
