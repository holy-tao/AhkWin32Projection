#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The APTTYPE (objidlbase.h) enumeration specifies different types of apartments.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ne-objidlbase-apttype
 * @namespace Windows.Win32.System.Com
 */
class APTTYPE extends Win32Enum {

    /**
     * The current thread.
     * Native name: APTTYPE_CURRENT
     * @type {Integer (Int32)}
     */
    static CURRENT => -1

    /**
     * A single-threaded apartment.
     * Native name: APTTYPE_STA
     * @type {Integer (Int32)}
     */
    static STA => 0

    /**
     * A multithreaded apartment.
     * Native name: APTTYPE_MTA
     * @type {Integer (Int32)}
     */
    static MTA => 1

    /**
     * A neutral apartment.
     * Native name: APTTYPE_NA
     * @type {Integer (Int32)}
     */
    static NA => 2

    /**
     * The main single-threaded apartment.
     * Native name: APTTYPE_MAINSTA
     * @type {Integer (Int32)}
     */
    static MAINSTA => 3
}
