#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class NSTCGNI extends Win32Enum {

    /**
     * Native name: NSTCGNI_NEXT
     * @type {Integer (Int32)}
     */
    static NEXT => 0

    /**
     * Native name: NSTCGNI_NEXTVISIBLE
     * @type {Integer (Int32)}
     */
    static NEXTVISIBLE => 1

    /**
     * Native name: NSTCGNI_PREV
     * @type {Integer (Int32)}
     */
    static PREV => 2

    /**
     * Native name: NSTCGNI_PREVVISIBLE
     * @type {Integer (Int32)}
     */
    static PREVVISIBLE => 3

    /**
     * Native name: NSTCGNI_PARENT
     * @type {Integer (Int32)}
     */
    static PARENT => 4

    /**
     * Native name: NSTCGNI_CHILD
     * @type {Integer (Int32)}
     */
    static CHILD => 5

    /**
     * Native name: NSTCGNI_FIRSTVISIBLE
     * @type {Integer (Int32)}
     */
    static FIRSTVISIBLE => 6

    /**
     * Native name: NSTCGNI_LASTVISIBLE
     * @type {Integer (Int32)}
     */
    static LASTVISIBLE => 7
}
