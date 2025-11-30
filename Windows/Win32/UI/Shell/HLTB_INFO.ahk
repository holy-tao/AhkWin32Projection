#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class HLTB_INFO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HLTB_DOCKEDLEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HLTB_DOCKEDTOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static HLTB_DOCKEDRIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HLTB_DOCKEDBOTTOM => 3

    /**
     * @type {Integer (Int32)}
     */
    static HLTB_FLOATING => 4
}
