#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The THDTYPE (objidlbase.h) enumeration indicates whether a particular thread supports a message loop.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ne-objidlbase-thdtype
 * @namespace Windows.Win32.System.Com
 */
export default struct THDTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
