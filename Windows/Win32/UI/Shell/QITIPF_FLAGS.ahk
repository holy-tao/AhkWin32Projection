#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class QITIPF_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: QITIPF_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: QITIPF_USENAME
     * @type {Integer (Int32)}
     */
    static USENAME => 1

    /**
     * Native name: QITIPF_LINKNOTARGET
     * @type {Integer (Int32)}
     */
    static LINKNOTARGET => 2

    /**
     * Native name: QITIPF_LINKUSETARGET
     * @type {Integer (Int32)}
     */
    static LINKUSETARGET => 4

    /**
     * Native name: QITIPF_USESLOWTIP
     * @type {Integer (Int32)}
     */
    static USESLOWTIP => 8

    /**
     * Native name: QITIPF_SINGLELINE
     * @type {Integer (Int32)}
     */
    static SINGLELINE => 16

    /**
     * @type {Integer (Int32)}
     */
    static QIF_CACHED => 1

    /**
     * @type {Integer (Int32)}
     */
    static QIF_DONTEXPANDFOLDER => 2
}
