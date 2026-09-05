#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class PSPCB_MESSAGE extends Win32Enum {

    /**
     * Native name: PSPCB_ADDREF
     * @type {Integer (UInt32)}
     */
    static ADDREF => 0

    /**
     * Native name: PSPCB_CREATE
     * @type {Integer (UInt32)}
     */
    static CREATE => 2

    /**
     * Native name: PSPCB_RELEASE
     * @type {Integer (UInt32)}
     */
    static RELEASE => 1

    /**
     * Native name: PSPCB_SI_INITDIALOG
     * @type {Integer (UInt32)}
     */
    static SI_INITDIALOG => 1025
}
