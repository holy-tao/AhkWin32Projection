#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_CHANGE_STATE extends Win32Enum {

    /**
     * Native name: BDA_CHANGES_COMPLETE
     * @type {Integer (Int32)}
     */
    static CHANGES_COMPLETE => 0

    /**
     * Native name: BDA_CHANGES_PENDING
     * @type {Integer (Int32)}
     */
    static CHANGES_PENDING => 1
}
