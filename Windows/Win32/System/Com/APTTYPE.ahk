#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The APTTYPE (objidlbase.h) enumeration specifies different types of apartments.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ne-objidlbase-apttype
 * @namespace Windows.Win32.System.Com
 */
export default struct APTTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The current thread.
     * @type {Integer (Int32)}
     */
    static APTTYPE_CURRENT => -1

    /**
     * A single-threaded apartment.
     * @type {Integer (Int32)}
     */
    static APTTYPE_STA => 0

    /**
     * A multithreaded apartment.
     * @type {Integer (Int32)}
     */
    static APTTYPE_MTA => 1

    /**
     * A neutral apartment.
     * @type {Integer (Int32)}
     */
    static APTTYPE_NA => 2

    /**
     * The main single-threaded apartment.
     * @type {Integer (Int32)}
     */
    static APTTYPE_MAINSTA => 3
}
