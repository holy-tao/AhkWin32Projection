#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_PROPERTY_FRAMESTEP extends Win32Enum {

    /**
     * Native name: AM_PROPERTY_FRAMESTEP_STEP
     * @type {Integer (Int32)}
     */
    static STEP => 1

    /**
     * Native name: AM_PROPERTY_FRAMESTEP_CANCEL
     * @type {Integer (Int32)}
     */
    static CANCEL => 2

    /**
     * Native name: AM_PROPERTY_FRAMESTEP_CANSTEP
     * @type {Integer (Int32)}
     */
    static CANSTEP => 3

    /**
     * Native name: AM_PROPERTY_FRAMESTEP_CANSTEPMULTIPLE
     * @type {Integer (Int32)}
     */
    static CANSTEPMULTIPLE => 4
}
