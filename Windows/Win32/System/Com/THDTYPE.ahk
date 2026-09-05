#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The THDTYPE (objidlbase.h) enumeration indicates whether a particular thread supports a message loop.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ne-objidlbase-thdtype
 * @namespace Windows.Win32.System.Com
 */
class THDTYPE extends Win32Enum {

    /**
     * The thread does not support a message loop. This behavior is associated with multithreaded apartments.
     * Native name: THDTYPE_BLOCKMESSAGES
     * @type {Integer (Int32)}
     */
    static BLOCKMESSAGES => 0

    /**
     * The thread supports a message loop. This behavior is associated with single-threaded apartments.
     * Native name: THDTYPE_PROCESSMESSAGES
     * @type {Integer (Int32)}
     */
    static PROCESSMESSAGES => 1
}
