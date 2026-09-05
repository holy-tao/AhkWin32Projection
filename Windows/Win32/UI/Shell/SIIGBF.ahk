#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SIIGBF extends Win32BitflagEnum {

    /**
     * Native name: SIIGBF_RESIZETOFIT
     * @type {Integer (Int32)}
     */
    static RESIZETOFIT => 0

    /**
     * Native name: SIIGBF_BIGGERSIZEOK
     * @type {Integer (Int32)}
     */
    static BIGGERSIZEOK => 1

    /**
     * Native name: SIIGBF_MEMORYONLY
     * @type {Integer (Int32)}
     */
    static MEMORYONLY => 2

    /**
     * Native name: SIIGBF_ICONONLY
     * @type {Integer (Int32)}
     */
    static ICONONLY => 4

    /**
     * Native name: SIIGBF_THUMBNAILONLY
     * @type {Integer (Int32)}
     */
    static THUMBNAILONLY => 8

    /**
     * Native name: SIIGBF_INCACHEONLY
     * @type {Integer (Int32)}
     */
    static INCACHEONLY => 16

    /**
     * Native name: SIIGBF_CROPTOSQUARE
     * @type {Integer (Int32)}
     */
    static CROPTOSQUARE => 32

    /**
     * Native name: SIIGBF_WIDETHUMBNAILS
     * @type {Integer (Int32)}
     */
    static WIDETHUMBNAILS => 64

    /**
     * Native name: SIIGBF_ICONBACKGROUND
     * @type {Integer (Int32)}
     */
    static ICONBACKGROUND => 128

    /**
     * Native name: SIIGBF_SCALEUP
     * @type {Integer (Int32)}
     */
    static SCALEUP => 256
}
