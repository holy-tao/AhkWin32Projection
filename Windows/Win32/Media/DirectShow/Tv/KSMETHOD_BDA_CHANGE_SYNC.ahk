#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_CHANGE_SYNC extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_START_CHANGES
     * @type {Integer (Int32)}
     */
    static START_CHANGES => 0

    /**
     * Native name: KSMETHOD_BDA_CHECK_CHANGES
     * @type {Integer (Int32)}
     */
    static CHECK_CHANGES => 1

    /**
     * Native name: KSMETHOD_BDA_COMMIT_CHANGES
     * @type {Integer (Int32)}
     */
    static COMMIT_CHANGES => 2

    /**
     * Native name: KSMETHOD_BDA_GET_CHANGE_STATE
     * @type {Integer (Int32)}
     */
    static GET_CHANGE_STATE => 3
}
