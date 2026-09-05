#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_CONDITIONALACCESS_SESSION_RESULT extends Win32Enum {

    /**
     * Native name: CONDITIONALACCESS_SUCCESSFULL
     * @type {Integer (Int32)}
     */
    static SUCCESSFULL => 0

    /**
     * Native name: CONDITIONALACCESS_ENDED_NOCHANGE
     * @type {Integer (Int32)}
     */
    static ENDED_NOCHANGE => 1

    /**
     * Native name: CONDITIONALACCESS_ABORTED
     * @type {Integer (Int32)}
     */
    static ABORTED => 2
}
