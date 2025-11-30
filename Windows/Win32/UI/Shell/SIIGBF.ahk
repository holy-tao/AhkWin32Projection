#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SIIGBF extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_RESIZETOFIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_BIGGERSIZEOK => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_MEMORYONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_ICONONLY => 4

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_THUMBNAILONLY => 8

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_INCACHEONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_CROPTOSQUARE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_WIDETHUMBNAILS => 64

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_ICONBACKGROUND => 128

    /**
     * @type {Integer (Int32)}
     */
    static SIIGBF_SCALEUP => 256
}
