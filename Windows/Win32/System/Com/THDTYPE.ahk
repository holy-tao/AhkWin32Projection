#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether a particular thread supports a message loop.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-thdtype
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class THDTYPE extends Win32Enum{

    /**
     * The thread does not support a message loop. This behavior is associated with multithreaded apartments.
     * @type {Integer (Int32)}
     */
    static THDTYPE_BLOCKMESSAGES => 0

    /**
     * The thread supports a message loop. This behavior is associated with single-threaded apartments.
     * @type {Integer (Int32)}
     */
    static THDTYPE_PROCESSMESSAGES => 1
}
