#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies different types of apartments.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-apttype
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class APTTYPE{

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
