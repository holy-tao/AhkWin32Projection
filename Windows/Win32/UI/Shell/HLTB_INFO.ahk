#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLTB_INFO extends Win32Enum {

    /**
     * Native name: HLTB_DOCKEDLEFT
     * @type {Integer (Int32)}
     */
    static DOCKEDLEFT => 0

    /**
     * Native name: HLTB_DOCKEDTOP
     * @type {Integer (Int32)}
     */
    static DOCKEDTOP => 1

    /**
     * Native name: HLTB_DOCKEDRIGHT
     * @type {Integer (Int32)}
     */
    static DOCKEDRIGHT => 2

    /**
     * Native name: HLTB_DOCKEDBOTTOM
     * @type {Integer (Int32)}
     */
    static DOCKEDBOTTOM => 3

    /**
     * Native name: HLTB_FLOATING
     * @type {Integer (Int32)}
     */
    static FLOATING => 4
}
